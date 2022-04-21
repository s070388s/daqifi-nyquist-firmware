using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.IO.Ports;
using System.IO;
using System.Threading;
using System.Text.RegularExpressions;
using System.Globalization;
using System.Collections;
using System.Diagnostics;

namespace Serial_Port_Logger
{


    public partial class Form1 : Form
    {
        const string COMMTEST_RESP_USB_OVERFLOW = "commtest:stats:usboverflow ";
        const string COMMTEST_RESP_TCP_OVERFLOW = "commtest:stats:tcpoverflow ";
        const string COMMTEST_RESP_DIO_OVERFLOW = "commtest:stats:diosamplelistoverflow ";
        const string COMMTEST_RESP_AIN_OVERFLOW = "commtest:stats:ainsamplelistoverflow ";

        public int interval_ms = 0;
        // load the start / stop streamming commands with default values

        //public string startStreamCommands = "SYSTem:ECHO 0\r\nEnable:Voltage:DC 249\r\nDIO:Port:Enable 1\r\nSystem:StartStreamData 1000\r\n";
        //public string stopStreamCommands  = "SYSTem:StopStreamData\r\n";

        public string startStreamCommands = "COMMTest:Type 0\r\nCOMMTest:BufSize 100\r\nCOMMTest:ClearStats\r\nCOMMTest:Enable 1\r\n";
        public string stopStreamCommands  = "COMMTest:Enable 0\r\nCOMMTest:Stats?\r\n";

        List<byte> COMBuf = new List<byte>();
        UInt32 goodpackets = 0, badpackets = 0, droppackets=0;
        UInt32 bytesReceive = 0;
        UInt32 bytesReceivePrev = 0;
        Stopwatch streamRateStopWatch = new Stopwatch();
        Stopwatch frameDelayStopWatch = new Stopwatch();
        bool stop = true;
        long stopwatchPrev = 0;
        Thread UIThread;
        UInt16 expectedCounter = 0;
        int packetLenMax = 0,packetLenMin=0xffff, packetLenInst=0;
        double frameDelayMax = 0.0, frameDelayMin = 0.0, frameDelayInst = 0.0;
        UInt32 usbOverflow = 0, tcpOverflow = 0, dioSampleListOverflow = 0, ainSampleListOverflow = 0;
        UInt32 timeStampPrev, timeStampMax, timeStampMin, timeStampInst;
      

        public Form1()
        {
            InitializeComponent();
            PortCbx.Items.AddRange(SerialPort.GetPortNames());
            serialPort1.Encoding = Encoding.GetEncoding(1252);
            UIThread = new Thread(new ThreadStart(UIThread_DoWork));
            UIThread.Start();

            // load the start stream command from configuration file if it was already saved earlier. otherwise use default value
            if (Properties.Settings.Default.startstreamcommand != "")
            this.startStreamCommands = Properties.Settings.Default.startstreamcommand;

            // load the stop stream command from configuration file if it was already saved earlier. otherwise use default value
            if (Properties.Settings.Default.stopstreamcommand != "")
            this.stopStreamCommands = Properties.Settings.Default.stopstreamcommand;
        }

        private void UIThread_DoWork()
        {
            while(true)
            {
                UpdateUI();
                Thread.Sleep(200);
            }

        }


        /// <summary>
        /// Update the user interface with the right information
        /// </summary>
        private void UpdateUI()
        {
            if (stop) return;

            // communication test variables
            if (UsbOverflowLbl.InvokeRequired)
            {
                this.Invoke(new EventHandler(delegate { UsbOverflowLbl.Text = usbOverflow.ToString(); }));
            }
            else
            {
                UsbOverflowLbl.Text = usbOverflow.ToString();
            }

            if (TcpOverflowLbl.InvokeRequired)
            {
                this.Invoke(new EventHandler(delegate { TcpOverflowLbl.Text = tcpOverflow.ToString(); }));
            }
            else
            {
                TcpOverflowLbl.Text = tcpOverflow.ToString();
            }

            if (DIOSampleListOverflowLbl.InvokeRequired)
            {
                this.Invoke(new EventHandler(delegate { DIOSampleListOverflowLbl.Text = dioSampleListOverflow.ToString(); }));
            }
            else
            {
                DIOSampleListOverflowLbl.Text = dioSampleListOverflow.ToString();
            }

            if (AINSampleListOverflowLbl.InvokeRequired)
            {
                this.Invoke(new EventHandler(delegate { AINSampleListOverflowLbl.Text = ainSampleListOverflow.ToString(); }));
            }
            else
            {
                AINSampleListOverflowLbl.Text = ainSampleListOverflow.ToString();
            }

            // delta timestamp 

            if (TimeStampMaxLbl.InvokeRequired)
            {
                this.Invoke(new EventHandler(delegate { TimeStampMaxLbl.Text = timeStampMax.ToString(); }));
            }
            else
            {
                TimeStampMaxLbl.Text = timeStampMax.ToString();
            }

            if (TimeStampMinLbl.InvokeRequired)
            {
                this.Invoke(new EventHandler(delegate { TimeStampMinLbl.Text = timeStampMin.ToString(); }));
            }
            else
            {
                TimeStampMinLbl.Text = timeStampMin.ToString();
            }

            if (TimeStampInstLbl.InvokeRequired)
            {
                this.Invoke(new EventHandler(delegate { TimeStampInstLbl.Text = timeStampInst.ToString(); }));
            }
            else
            {
                TimeStampInstLbl.Text = timeStampInst.ToString();
            }


            if (GoodPacket.InvokeRequired)
            {
                this.Invoke(new EventHandler(delegate { GoodPacket.Text = goodpackets.ToString(); }));
            }
            else
            {
                GoodPacket.Text = goodpackets.ToString();
            }

            if(BadPacket.InvokeRequired)
            {
                this.Invoke(new EventHandler(delegate { BadPacket.Text = badpackets.ToString(); }));
            }
            else
            {
                BadPacket.Text = badpackets.ToString();
            }

            if (PacketLenMax.InvokeRequired)
            {
                this.Invoke(new EventHandler(delegate { PacketLenMax.Text = packetLenMax.ToString(); }));
            }
            else
            {
                PacketLenMax.Text = packetLenMax.ToString();
            }

            if (PacketLenMin.InvokeRequired)
            {
                this.Invoke(new EventHandler(delegate { PacketLenMin.Text = packetLenMin.ToString(); }));
            }
            else
            {
                PacketLenMin.Text = packetLenMin.ToString();
            }

            if (PacketLenInst.InvokeRequired)
            {
                this.Invoke(new EventHandler(delegate { PacketLenInst.Text = packetLenInst.ToString(); }));
            }
            else
            {
                PacketLenInst.Text = packetLenInst.ToString();
            }

            if (PacketDrop.InvokeRequired)
            {
                this.Invoke(new EventHandler(delegate { PacketDrop.Text = droppackets.ToString(); }));
            }
            else
            {
                PacketDrop.Text = droppackets.ToString();
            }

            if (ElapseTime.InvokeRequired)
            {
                this.Invoke(new EventHandler(delegate { ElapseTime.Text = streamRateStopWatch.ElapsedMilliseconds.ToString() + " ms"; }));
            }
            else
            {
                ElapseTime.Text = streamRateStopWatch.ElapsedMilliseconds.ToString() + " ms";
            }

            if(FrameDelayInst.InvokeRequired)
            {
                this.Invoke(new EventHandler(delegate { FrameDelayInst.Text = frameDelayInst.ToString() + " ms"; }));
            }
            else
            {
                FrameDelayInst.Text = frameDelayInst.ToString() + " ms";
            }

            if (FrameDelayMin.InvokeRequired)
            {
                this.Invoke(new EventHandler(delegate { FrameDelayMin.Text = frameDelayMin.ToString() + " ms"; }));
            }
            else
            {
                FrameDelayMin.Text = frameDelayMin.ToString() + " ms";
            }

            if (FrameDelayMax.InvokeRequired)
            {
                this.Invoke(new EventHandler(delegate { FrameDelayMax.Text = frameDelayMax.ToString() + " ms"; }));
            }
            else
            {
                FrameDelayMax.Text = frameDelayMax.ToString() + " ms";
            }


            if (StreamRateAve.InvokeRequired)
            {
                this.Invoke(new EventHandler(delegate { StreamRateAve.Text = (((float)bytesReceive * 8.0f) / streamRateStopWatch.ElapsedMilliseconds).ToString("F") + " kbit/s"; }));
            }
            else
            {
                StreamRateAve.Text = (((float)bytesReceive * 8.0f) / streamRateStopWatch.ElapsedMilliseconds).ToString("F") + " kbit/s";
            }

            if (stopwatchPrev != 0 && bytesReceivePrev != 0)
            {
                if (StreamRateInst.InvokeRequired)
                {
                    this.Invoke(new EventHandler(delegate { StreamRateInst.Text = (((float)(bytesReceive - bytesReceivePrev) * 8.0f) / (streamRateStopWatch.ElapsedMilliseconds - stopwatchPrev)).ToString("F") + " kbit/s"; }));
                }
                else
                {
                    StreamRateInst.Text = (((float)(bytesReceive - bytesReceivePrev) * 8.0f) / (streamRateStopWatch.ElapsedMilliseconds - stopwatchPrev)).ToString("F") + " kbit/s";
                }
            }

            stopwatchPrev    = streamRateStopWatch.ElapsedMilliseconds;
            bytesReceivePrev = bytesReceive;
        }

        private void RefreshBtn_Click(object sender, EventArgs e)
        {
            PortCbx.Items.Clear();
            PortCbx.Items.AddRange(SerialPort.GetPortNames());
        }

        private void ConnectBtn_Click(object sender, EventArgs e)
        {
            try
            {
                serialPort1.PortName = PortCbx.SelectedItem.ToString();
                serialPort1.BaudRate = int.Parse(BaudRateCbx.SelectedItem.ToString());
                serialPort1.Open();

                ConnectBtn.Enabled = false;
                DisconnectBtn.Enabled = true;
                DisplayStatus(serialPort1.PortName + " " + serialPort1.BaudRate.ToString() + " Port Open");
            }
            catch (Exception err)
            {
                DisplayStatus("Err: Can't Open PORT. " + err.Message);
            }
        }

        private void DisplayStatus(string msg)
        {
            this.Invoke(new EventHandler(delegate { StatusLbl.Text = msg; }));
        }


        private void DisconnectBtn_Click(object sender, EventArgs e)
        {
            try
            {
                //send the stop streaming command if it already has started. 
                if (serialPort1.IsOpen)
                {
                    serialPort1.WriteLine("System:StopStreamData");
                    stop = true;
                }
                serialPort1.Close();
                ConnectBtn.Enabled = true;
                DisconnectBtn.Enabled = false;
                DisplayStatus("Port is Close");
            }
            catch (Exception err)
            {
                DisplayStatus("Err: Can't Close PORT. " + err.Message);
            }
        }

        private void stopStreamingCmdToolStripMenuItem_Click(object sender, EventArgs e)
        {
            StreamCommand StreamCommandForm = new StreamCommand(this, false);
            StreamCommandForm.ShowDialog();
        }

        private void startStreamingCmdToolStripMenuItem_Click(object sender, EventArgs e)
        {
            StreamCommand StreamCommandForm = new StreamCommand(this, true);
            StreamCommandForm.ShowDialog();
        }

        private void serialPortProcessBuf(byte[] buf, int len)
        {
            string bufstr;
            long elapsedTicks;
            double elapsedMs;

            // First byte must match the '#'
            // Packet length must be at least 11 bytes.
            if ((buf[0] == '#') && (len>=11))
            {
                //the stream data is always little endian
                UInt32 timestamp = 0;
                UInt16 counter   = 0;
                UInt16 checksum  = 0;
                UInt16 checksum2 = 0;

                if (BitConverter.IsLittleEndian == false)
                {
                    // reverse the packet bytes if we are decoding the packet from a big Endian system.
                    Array.Reverse(buf, 1, 4);
                    Array.Reverse(buf, 5, 2);
                    Array.Reverse(buf, len - 4, 2);
                    timestamp = (UInt32)(buf[1] << 24 | buf[2] << 16 | buf[3] << 8 | buf[4]);
                    counter = (UInt16)(buf[5] << 8 | buf[6]);
                    checksum = (UInt16)(buf[len - 4] << 8 | buf[len - 3]);
                }
                else
                {
                    // decode the packet
                    timestamp = BitConverter.ToUInt32(buf, 1);
                    counter = BitConverter.ToUInt16(buf, 5);
                    checksum = BitConverter.ToUInt16(buf, len - 4);
                }
                    
                // recompute the checksum for the packet
                for(int i=0; i < (len - 4); i++)
                {
                    checksum2 += (UInt16)buf[i];
                }

                // checksum matches
                if (checksum2 == checksum)
                {
                    if(goodpackets == 0)
                    {
                        // resynch the expected counter 
                        // everytime a new streaming session has started
                        expectedCounter = counter;
                    }

                    // does the counter match the expected value? 
                    if (expectedCounter == counter)
                    { 
                        goodpackets++;
                        packetLenInst = len;
                        if (len > packetLenMax) packetLenMax = len;
                        if (len < packetLenMin) packetLenMin = len;


                        if (frameDelayStopWatch.IsRunning)
                        {
                            elapsedTicks = frameDelayStopWatch.ElapsedTicks;

                            // convert the elapsedTicks to delay in microseconds
                            elapsedMs = ((elapsedTicks* 1000.0) / Stopwatch.Frequency);

                            frameDelayInst = elapsedMs;
                            if (elapsedMs > frameDelayMax) frameDelayMax = elapsedMs;
                            if (elapsedMs < frameDelayMin) frameDelayMin = elapsedMs;
                        }

                        // get the delta of timestamp between this packet and the previous one. 
                        UInt32 delta;
                        if (timeStampPrev > 0)
                        {
                            delta = timestamp - timeStampPrev;
                            timeStampInst = delta;
                            if (delta > timeStampMax) timeStampMax = delta;
                            if (delta < timeStampMin) timeStampMin = delta;
                        }
                        timeStampPrev = timestamp;

                        //reset the frame delay
                        frameDelayStopWatch.Restart();
                    }
                    else
                    {
                        droppackets++;//no match indicates dropped packets
                    }

                    expectedCounter = (UInt16)(counter + 1);
                }
                else
                {
                    // bad crc.
                    badpackets++;
                }
            }
            else
            {

                // packets not starting with '#' will be decoded as normal scpi commands.
                bufstr = System.Text.Encoding.UTF8.GetString(buf);
                bufstr = bufstr.ToLower();
                if(bufstr.StartsWith("enable")|| bufstr.StartsWith("daqifi") || bufstr.StartsWith("system") || bufstr.StartsWith("commtest"))
                {
                    // remove the newline from each packet
                    bufstr = bufstr.Replace("\r\n","");

                    if (bufstr.IndexOf(COMMTEST_RESP_USB_OVERFLOW) >= 0)
                    {
                        bufstr = bufstr.Replace(COMMTEST_RESP_USB_OVERFLOW, "");
                        usbOverflow = UInt32.Parse(bufstr);
                    }
                    else if (bufstr.IndexOf(COMMTEST_RESP_TCP_OVERFLOW) >= 0)
                    {
                        bufstr = bufstr.Replace(COMMTEST_RESP_TCP_OVERFLOW, "");
                        tcpOverflow = UInt32.Parse(bufstr);
                    }
                    else if (bufstr.IndexOf(COMMTEST_RESP_DIO_OVERFLOW) >= 0)
                    {
                        bufstr = bufstr.Replace(COMMTEST_RESP_DIO_OVERFLOW, "");
                        dioSampleListOverflow = UInt32.Parse(bufstr);
                    }
                    else if (bufstr.IndexOf(COMMTEST_RESP_AIN_OVERFLOW) >= 0)
                    {
                        bufstr = bufstr.Replace(COMMTEST_RESP_AIN_OVERFLOW, "");
                        ainSampleListOverflow = UInt32.Parse(bufstr);
                    }
                    else
                    {
                        // ignore nyquist scpi commands. we are not interested
                    }
                }
                else
                {
                    // undefined commands will be treated as corrupted packet. 
                    badpackets++;
                }
            }
        }

 

        private void serialPort1_DataReceived(object sender, SerialDataReceivedEventArgs e)
        {
            int bytes_to_read;
            byte[] tempBuf = new byte[1000];
        
            bytes_to_read = serialPort1.BytesToRead;

            while(bytes_to_read > 0)
            {
                // check if we have enough space to read all bytes from serial port
                if (bytes_to_read <= tempBuf.Length) 
                {
                    // we have enough buffer to read all pending bytes.
                    serialPort1.Read(tempBuf, 0, bytes_to_read);
                    Array.Resize(ref tempBuf, bytes_to_read);
                    bytesReceive += (UInt32)bytes_to_read;
                    bytes_to_read = 0; // nothing more to read from serial port
                }
                else
                {
                    serialPort1.Read(tempBuf,0, tempBuf.Length);
                    Array.Resize(ref tempBuf, tempBuf.Length);
                    bytesReceive  += (UInt32)tempBuf.Length;
                    bytes_to_read -= tempBuf.Length;
                }

             
                foreach (byte c in tempBuf)
                {
                    if ((COMBuf.Count >= 10) && (c == '\n') && (COMBuf.Last() == '\r'))
                    {
                        COMBuf.Add(c);

                        // process the data received from Nyquist device.
                        serialPortProcessBuf(COMBuf.ToArray(), COMBuf.Count);
                        // clear the com buffer
                        COMBuf.Clear();
                    }
                    else
                    {
                        COMBuf.Add(c);
                    }
                }
                // we have finished processing the buffer. 
                // Now eset the buffer size to 1000 to continue reading from serial port. 
                Array.Resize(ref tempBuf, 1000);
            }
        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            // send scpi command to stop streaming data before the program is closed. 
            if (serialPort1.IsOpen)
            {

                string[] separators = new string[] { "\r\n" };
                string[] commands = this.stopStreamCommands.Split(separators, StringSplitOptions.None);

                foreach (string cmd in commands)
                {
                    // send all scpi commands defined in the stream commands form. 
                    serialPort1.WriteLine(cmd);
                    Thread.Sleep(5);
                }
                stop = true;
            }

            serialPort1.Close();
            UIThread.Abort();
        }

 
        private void runBtn_Click(object sender, EventArgs e)
        {
            try
            {

                COMBuf.Clear();

                string[] separators = new string[] {"\r\n"};
                string[] commands = this.startStreamCommands.Split(separators, StringSplitOptions.None);

                foreach(string cmd in commands)
                {
                    // send all scpi commands defined in the stream commands form. 
                    serialPort1.WriteLine(cmd);
                    Thread.Sleep(5);
                }

                // reset comm test stats
                usbOverflow           = 0;
                tcpOverflow           = 0;
                dioSampleListOverflow = 0;
                ainSampleListOverflow = 0;

                expectedCounter  = 0;
                badpackets       = 0;
                droppackets      = 0;
                goodpackets      = 0;
                bytesReceive     = 0;
                bytesReceivePrev = 0;
                stopwatchPrev    = 0;
                // reset inter-frame delays
                frameDelayMax    = 0;
                frameDelayMin    = 1000000;
                frameDelayInst   = 0;
                // reset packet length
                packetLenMin     = 0xffff;
                packetLenMax     = 0;
                packetLenInst    = 0;
                // reset time stamp
                timeStampPrev    = 0;
                timeStampMin     = 0xffffffff;
                timeStampMax     = 0;
                timeStampInst    = 0;

                stop = false;
                frameDelayStopWatch.Stop(); //frameDelayStopWatch will start running when the first packet is received. 
                streamRateStopWatch.Restart();

            }
            catch (Exception err)
            {
                DisplayStatus("Tx Err: " + err.Message);
            }
        }

        private void stopBtn_Click(object sender, EventArgs e)
        {
            try
            {
                // stop streaming data

                string[] separators = new string[] { "\r\n" };
                string[] commands = this.stopStreamCommands.Split(separators, StringSplitOptions.None);

                foreach (string cmd in commands)
                {
                    // send all scpi commands defined in the stream commands form. 
                    serialPort1.WriteLine(cmd);
                    Thread.Sleep(5);
                }

                stop = true;
                frameDelayStopWatch.Stop();
            }
            catch (Exception err)
            {
                DisplayStatus("Tx Err: " + err.Message);
            }
        }
    }
}
