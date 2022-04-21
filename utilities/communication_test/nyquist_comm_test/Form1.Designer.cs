namespace Serial_Port_Logger
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.flowLayoutPanel11 = new System.Windows.Forms.FlowLayoutPanel();
            this.label25 = new System.Windows.Forms.Label();
            this.BaudRateCbx = new System.Windows.Forms.ComboBox();
            this.label26 = new System.Windows.Forms.Label();
            this.PortCbx = new System.Windows.Forms.ComboBox();
            this.RefreshBtn = new System.Windows.Forms.Button();
            this.ConnectBtn = new System.Windows.Forms.Button();
            this.DisconnectBtn = new System.Windows.Forms.Button();
            this.runBtn = new System.Windows.Forms.Button();
            this.stopBtn = new System.Windows.Forms.Button();
            this.serialPort1 = new System.IO.Ports.SerialPort(this.components);
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.StatusLbl = new System.Windows.Forms.ToolStripStatusLabel();
            this.toolStripStatusLabel1 = new System.Windows.Forms.ToolStripStatusLabel();
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            this.contextMenuStrip1 = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.clearToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.copyAllToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.saveAsMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.txSettingToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.startStreamingCmd = new System.Windows.Forms.ToolStripMenuItem();
            this.stopStreamingCmd = new System.Windows.Forms.ToolStripMenuItem();
            this.saveFileDialog1 = new System.Windows.Forms.SaveFileDialog();
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.AINSampleListOverflowLbl = new System.Windows.Forms.Label();
            this.DIOSampleListOverflowLbl = new System.Windows.Forms.Label();
            this.TcpOverflowLbl = new System.Windows.Forms.Label();
            this.UsbOverflowLbl = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.PacketLenInst = new System.Windows.Forms.Label();
            this.PacketLenMin = new System.Windows.Forms.Label();
            this.PacketLenMax = new System.Windows.Forms.Label();
            this.FrameDelayMin = new System.Windows.Forms.Label();
            this.FrameDelayMax = new System.Windows.Forms.Label();
            this.FrameDelayInst = new System.Windows.Forms.Label();
            this.label11 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.GoodPacket = new System.Windows.Forms.Label();
            this.BadPacket = new System.Windows.Forms.Label();
            this.PacketDrop = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.ElapseTime = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.StreamRateAve = new System.Windows.Forms.Label();
            this.StreamRateInst = new System.Windows.Forms.Label();
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.tableLayoutPanel2 = new System.Windows.Forms.TableLayoutPanel();
            this.label14 = new System.Windows.Forms.Label();
            this.label16 = new System.Windows.Forms.Label();
            this.tableLayoutPanel3 = new System.Windows.Forms.TableLayoutPanel();
            this.label5 = new System.Windows.Forms.Label();
            this.label18 = new System.Windows.Forms.Label();
            this.tableLayoutPanel4 = new System.Windows.Forms.TableLayoutPanel();
            this.label22 = new System.Windows.Forms.Label();
            this.label23 = new System.Windows.Forms.Label();
            this.label24 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.tableLayoutPanel5 = new System.Windows.Forms.TableLayoutPanel();
            this.label10 = new System.Windows.Forms.Label();
            this.label12 = new System.Windows.Forms.Label();
            this.label13 = new System.Windows.Forms.Label();
            this.label28 = new System.Windows.Forms.Label();
            this.label15 = new System.Windows.Forms.Label();
            this.tableLayoutPanel6 = new System.Windows.Forms.TableLayoutPanel();
            this.label17 = new System.Windows.Forms.Label();
            this.label19 = new System.Windows.Forms.Label();
            this.label20 = new System.Windows.Forms.Label();
            this.TimeStampInstLbl = new System.Windows.Forms.Label();
            this.TimeStampMaxLbl = new System.Windows.Forms.Label();
            this.TimeStampMinLbl = new System.Windows.Forms.Label();
            this.flowLayoutPanel11.SuspendLayout();
            this.statusStrip1.SuspendLayout();
            this.contextMenuStrip1.SuspendLayout();
            this.menuStrip1.SuspendLayout();
            this.tableLayoutPanel1.SuspendLayout();
            this.tabControl1.SuspendLayout();
            this.tabPage1.SuspendLayout();
            this.tableLayoutPanel2.SuspendLayout();
            this.tableLayoutPanel3.SuspendLayout();
            this.tableLayoutPanel4.SuspendLayout();
            this.tableLayoutPanel5.SuspendLayout();
            this.tableLayoutPanel6.SuspendLayout();
            this.SuspendLayout();
            // 
            // flowLayoutPanel11
            // 
            this.flowLayoutPanel11.Controls.Add(this.label25);
            this.flowLayoutPanel11.Controls.Add(this.BaudRateCbx);
            this.flowLayoutPanel11.Controls.Add(this.label26);
            this.flowLayoutPanel11.Controls.Add(this.PortCbx);
            this.flowLayoutPanel11.Controls.Add(this.RefreshBtn);
            this.flowLayoutPanel11.Controls.Add(this.ConnectBtn);
            this.flowLayoutPanel11.Controls.Add(this.DisconnectBtn);
            this.flowLayoutPanel11.Dock = System.Windows.Forms.DockStyle.Fill;
            this.flowLayoutPanel11.Location = new System.Drawing.Point(3, 3);
            this.flowLayoutPanel11.Margin = new System.Windows.Forms.Padding(4);
            this.flowLayoutPanel11.Name = "flowLayoutPanel11";
            this.flowLayoutPanel11.Padding = new System.Windows.Forms.Padding(0, 10, 0, 0);
            this.flowLayoutPanel11.Size = new System.Drawing.Size(668, 50);
            this.flowLayoutPanel11.TabIndex = 32;
            // 
            // label25
            // 
            this.label25.AutoSize = true;
            this.label25.Location = new System.Drawing.Point(4, 16);
            this.label25.Margin = new System.Windows.Forms.Padding(4, 6, 4, 0);
            this.label25.Name = "label25";
            this.label25.Size = new System.Drawing.Size(71, 17);
            this.label25.TabIndex = 5;
            this.label25.Text = "BaudRate";
            // 
            // BaudRateCbx
            // 
            this.BaudRateCbx.FormattingEnabled = true;
            this.BaudRateCbx.Items.AddRange(new object[] {
            "9600",
            "14400",
            "19200",
            "38400",
            "56000",
            "57600",
            "115200",
            "128000",
            "245000",
            "512000",
            "921600"});
            this.BaudRateCbx.Location = new System.Drawing.Point(83, 14);
            this.BaudRateCbx.Margin = new System.Windows.Forms.Padding(4);
            this.BaudRateCbx.Name = "BaudRateCbx";
            this.BaudRateCbx.Size = new System.Drawing.Size(92, 24);
            this.BaudRateCbx.TabIndex = 4;
            this.BaudRateCbx.Text = "115200";
            // 
            // label26
            // 
            this.label26.Location = new System.Drawing.Point(192, 16);
            this.label26.Margin = new System.Windows.Forms.Padding(13, 6, 4, 0);
            this.label26.Name = "label26";
            this.label26.Size = new System.Drawing.Size(47, 16);
            this.label26.TabIndex = 6;
            this.label26.Text = "Port";
            // 
            // PortCbx
            // 
            this.PortCbx.FormattingEnabled = true;
            this.PortCbx.Location = new System.Drawing.Point(247, 14);
            this.PortCbx.Margin = new System.Windows.Forms.Padding(4);
            this.PortCbx.Name = "PortCbx";
            this.PortCbx.Size = new System.Drawing.Size(100, 24);
            this.PortCbx.TabIndex = 3;
            // 
            // RefreshBtn
            // 
            this.RefreshBtn.Location = new System.Drawing.Point(355, 11);
            this.RefreshBtn.Margin = new System.Windows.Forms.Padding(4, 1, 4, 1);
            this.RefreshBtn.Name = "RefreshBtn";
            this.RefreshBtn.Size = new System.Drawing.Size(73, 28);
            this.RefreshBtn.TabIndex = 9;
            this.RefreshBtn.Text = "Refresh";
            this.RefreshBtn.UseVisualStyleBackColor = true;
            this.RefreshBtn.Click += new System.EventHandler(this.RefreshBtn_Click);
            // 
            // ConnectBtn
            // 
            this.ConnectBtn.Location = new System.Drawing.Point(436, 11);
            this.ConnectBtn.Margin = new System.Windows.Forms.Padding(4, 1, 4, 1);
            this.ConnectBtn.Name = "ConnectBtn";
            this.ConnectBtn.Size = new System.Drawing.Size(81, 28);
            this.ConnectBtn.TabIndex = 8;
            this.ConnectBtn.Text = "Connect";
            this.ConnectBtn.UseVisualStyleBackColor = true;
            this.ConnectBtn.Click += new System.EventHandler(this.ConnectBtn_Click);
            // 
            // DisconnectBtn
            // 
            this.DisconnectBtn.Location = new System.Drawing.Point(525, 11);
            this.DisconnectBtn.Margin = new System.Windows.Forms.Padding(4, 1, 4, 1);
            this.DisconnectBtn.Name = "DisconnectBtn";
            this.DisconnectBtn.Size = new System.Drawing.Size(97, 28);
            this.DisconnectBtn.TabIndex = 10;
            this.DisconnectBtn.Text = "Disconnect";
            this.DisconnectBtn.UseVisualStyleBackColor = true;
            this.DisconnectBtn.Click += new System.EventHandler(this.DisconnectBtn_Click);
            // 
            // runBtn
            // 
            this.runBtn.BackColor = System.Drawing.Color.Lime;
            this.runBtn.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.runBtn.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.runBtn.Location = new System.Drawing.Point(710, 128);
            this.runBtn.Margin = new System.Windows.Forms.Padding(4);
            this.runBtn.Name = "runBtn";
            this.runBtn.Size = new System.Drawing.Size(114, 64);
            this.runBtn.TabIndex = 11;
            this.runBtn.Text = "Start Streaming";
            this.runBtn.UseVisualStyleBackColor = false;
            this.runBtn.Click += new System.EventHandler(this.runBtn_Click);
            // 
            // stopBtn
            // 
            this.stopBtn.BackColor = System.Drawing.Color.Red;
            this.stopBtn.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.stopBtn.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.stopBtn.ForeColor = System.Drawing.Color.White;
            this.stopBtn.Location = new System.Drawing.Point(710, 213);
            this.stopBtn.Margin = new System.Windows.Forms.Padding(4);
            this.stopBtn.Name = "stopBtn";
            this.stopBtn.Size = new System.Drawing.Size(114, 64);
            this.stopBtn.TabIndex = 12;
            this.stopBtn.Text = "Stop Streaming";
            this.stopBtn.UseVisualStyleBackColor = false;
            this.stopBtn.Click += new System.EventHandler(this.stopBtn_Click);
            // 
            // serialPort1
            // 
            this.serialPort1.BaudRate = 115200;
            this.serialPort1.DtrEnable = true;
            this.serialPort1.ReadBufferSize = 65536;
            this.serialPort1.RtsEnable = true;
            this.serialPort1.WriteBufferSize = 65536;
            this.serialPort1.WriteTimeout = 50;
            this.serialPort1.DataReceived += new System.IO.Ports.SerialDataReceivedEventHandler(this.serialPort1_DataReceived);
            // 
            // statusStrip1
            // 
            this.statusStrip1.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.statusStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.StatusLbl,
            this.toolStripStatusLabel1});
            this.statusStrip1.Location = new System.Drawing.Point(0, 696);
            this.statusStrip1.Name = "statusStrip1";
            this.statusStrip1.Padding = new System.Windows.Forms.Padding(1, 0, 19, 0);
            this.statusStrip1.Size = new System.Drawing.Size(837, 22);
            this.statusStrip1.TabIndex = 36;
            this.statusStrip1.Text = "statusStrip1";
            // 
            // StatusLbl
            // 
            this.StatusLbl.Name = "StatusLbl";
            this.StatusLbl.Size = new System.Drawing.Size(0, 17);
            // 
            // toolStripStatusLabel1
            // 
            this.toolStripStatusLabel1.Name = "toolStripStatusLabel1";
            this.toolStripStatusLabel1.Size = new System.Drawing.Size(0, 17);
            // 
            // timer1
            // 
            this.timer1.Interval = 1000;
            // 
            // contextMenuStrip1
            // 
            this.contextMenuStrip1.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.contextMenuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.clearToolStripMenuItem,
            this.copyAllToolStripMenuItem,
            this.saveAsMenuItem});
            this.contextMenuStrip1.Name = "contextMenuStrip1";
            this.contextMenuStrip1.Size = new System.Drawing.Size(203, 76);
            // 
            // clearToolStripMenuItem
            // 
            this.clearToolStripMenuItem.Name = "clearToolStripMenuItem";
            this.clearToolStripMenuItem.Size = new System.Drawing.Size(202, 24);
            this.clearToolStripMenuItem.Text = "Clear";
            // 
            // copyAllToolStripMenuItem
            // 
            this.copyAllToolStripMenuItem.Name = "copyAllToolStripMenuItem";
            this.copyAllToolStripMenuItem.Size = new System.Drawing.Size(202, 24);
            this.copyAllToolStripMenuItem.Text = "Copy To Clipboard";
            // 
            // saveAsMenuItem
            // 
            this.saveAsMenuItem.Name = "saveAsMenuItem";
            this.saveAsMenuItem.Size = new System.Drawing.Size(202, 24);
            this.saveAsMenuItem.Text = "Save As";
            // 
            // menuStrip1
            // 
            this.menuStrip1.BackColor = System.Drawing.SystemColors.ControlLight;
            this.menuStrip1.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.txSettingToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Padding = new System.Windows.Forms.Padding(5, 2, 0, 2);
            this.menuStrip1.Size = new System.Drawing.Size(837, 28);
            this.menuStrip1.TabIndex = 44;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // txSettingToolStripMenuItem
            // 
            this.txSettingToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.startStreamingCmd,
            this.stopStreamingCmd});
            this.txSettingToolStripMenuItem.Name = "txSettingToolStripMenuItem";
            this.txSettingToolStripMenuItem.Size = new System.Drawing.Size(88, 24);
            this.txSettingToolStripMenuItem.Text = "Tx-Setting";
            // 
            // startStreamingCmd
            // 
            this.startStreamingCmd.Name = "startStreamingCmd";
            this.startStreamingCmd.Size = new System.Drawing.Size(222, 26);
            this.startStreamingCmd.Text = "Start Streaming Cmd";
            this.startStreamingCmd.Click += new System.EventHandler(this.startStreamingCmdToolStripMenuItem_Click);
            // 
            // stopStreamingCmd
            // 
            this.stopStreamingCmd.Name = "stopStreamingCmd";
            this.stopStreamingCmd.Size = new System.Drawing.Size(222, 26);
            this.stopStreamingCmd.Text = "Stop Streaming Cmd";
            this.stopStreamingCmd.Click += new System.EventHandler(this.stopStreamingCmdToolStripMenuItem_Click);
            // 
            // saveFileDialog1
            // 
            this.saveFileDialog1.DefaultExt = "txt";
            this.saveFileDialog1.Filter = "\"Text (*.txt)|*.txt|Word Doc (*.doc)|*.doc";
            this.saveFileDialog1.SupportMultiDottedExtensions = true;
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.tableLayoutPanel1.CellBorderStyle = System.Windows.Forms.TableLayoutPanelCellBorderStyle.Single;
            this.tableLayoutPanel1.ColumnCount = 2;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 39.35185F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 60.64815F));
            this.tableLayoutPanel1.Controls.Add(this.label15, 0, 16);
            this.tableLayoutPanel1.Controls.Add(this.tableLayoutPanel6, 1, 16);
            this.tableLayoutPanel1.Controls.Add(this.tableLayoutPanel5, 1, 12);
            this.tableLayoutPanel1.Controls.Add(this.tableLayoutPanel3, 1, 9);
            this.tableLayoutPanel1.Controls.Add(this.tableLayoutPanel4, 1, 6);
            this.tableLayoutPanel1.Controls.Add(this.tableLayoutPanel2, 1, 1);
            this.tableLayoutPanel1.Controls.Add(this.label7, 0, 12);
            this.tableLayoutPanel1.Controls.Add(this.label11, 0, 9);
            this.tableLayoutPanel1.Controls.Add(this.label8, 0, 6);
            this.tableLayoutPanel1.Controls.Add(this.GoodPacket, 1, 3);
            this.tableLayoutPanel1.Controls.Add(this.BadPacket, 1, 4);
            this.tableLayoutPanel1.Controls.Add(this.PacketDrop, 1, 5);
            this.tableLayoutPanel1.Controls.Add(this.label1, 0, 3);
            this.tableLayoutPanel1.Controls.Add(this.label6, 0, 5);
            this.tableLayoutPanel1.Controls.Add(this.label2, 0, 4);
            this.tableLayoutPanel1.Controls.Add(this.ElapseTime, 1, 0);
            this.tableLayoutPanel1.Controls.Add(this.label3, 0, 0);
            this.tableLayoutPanel1.Controls.Add(this.label4, 0, 1);
            this.tableLayoutPanel1.Location = new System.Drawing.Point(19, 128);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 17;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel1.Size = new System.Drawing.Size(668, 565);
            this.tableLayoutPanel1.TabIndex = 55;
            // 
            // AINSampleListOverflowLbl
            // 
            this.AINSampleListOverflowLbl.AutoSize = true;
            this.AINSampleListOverflowLbl.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.AINSampleListOverflowLbl.ForeColor = System.Drawing.Color.Red;
            this.AINSampleListOverflowLbl.Location = new System.Drawing.Point(199, 79);
            this.AINSampleListOverflowLbl.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.AINSampleListOverflowLbl.Name = "AINSampleListOverflowLbl";
            this.AINSampleListOverflowLbl.Size = new System.Drawing.Size(23, 25);
            this.AINSampleListOverflowLbl.TabIndex = 59;
            this.AINSampleListOverflowLbl.Text = "0";
            // 
            // DIOSampleListOverflowLbl
            // 
            this.DIOSampleListOverflowLbl.AutoSize = true;
            this.DIOSampleListOverflowLbl.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.DIOSampleListOverflowLbl.ForeColor = System.Drawing.Color.Red;
            this.DIOSampleListOverflowLbl.Location = new System.Drawing.Point(199, 53);
            this.DIOSampleListOverflowLbl.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.DIOSampleListOverflowLbl.Name = "DIOSampleListOverflowLbl";
            this.DIOSampleListOverflowLbl.Size = new System.Drawing.Size(23, 25);
            this.DIOSampleListOverflowLbl.TabIndex = 58;
            this.DIOSampleListOverflowLbl.Text = "0";
            // 
            // TcpOverflowLbl
            // 
            this.TcpOverflowLbl.AutoSize = true;
            this.TcpOverflowLbl.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.TcpOverflowLbl.ForeColor = System.Drawing.Color.Red;
            this.TcpOverflowLbl.Location = new System.Drawing.Point(199, 27);
            this.TcpOverflowLbl.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.TcpOverflowLbl.Name = "TcpOverflowLbl";
            this.TcpOverflowLbl.Size = new System.Drawing.Size(23, 25);
            this.TcpOverflowLbl.TabIndex = 58;
            this.TcpOverflowLbl.Text = "0";
            // 
            // UsbOverflowLbl
            // 
            this.UsbOverflowLbl.AutoSize = true;
            this.UsbOverflowLbl.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.UsbOverflowLbl.ForeColor = System.Drawing.Color.Red;
            this.UsbOverflowLbl.Location = new System.Drawing.Point(199, 1);
            this.UsbOverflowLbl.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.UsbOverflowLbl.Name = "UsbOverflowLbl";
            this.UsbOverflowLbl.Size = new System.Drawing.Size(23, 25);
            this.UsbOverflowLbl.TabIndex = 57;
            this.UsbOverflowLbl.Text = "0";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.Location = new System.Drawing.Point(5, 352);
            this.label7.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(154, 25);
            this.label7.TabIndex = 69;
            this.label7.Text = "Overflow Events";
            // 
            // PacketLenInst
            // 
            this.PacketLenInst.AutoSize = true;
            this.PacketLenInst.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.PacketLenInst.ForeColor = System.Drawing.Color.RoyalBlue;
            this.PacketLenInst.Location = new System.Drawing.Point(199, 1);
            this.PacketLenInst.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.PacketLenInst.Name = "PacketLenInst";
            this.PacketLenInst.Size = new System.Drawing.Size(23, 25);
            this.PacketLenInst.TabIndex = 68;
            this.PacketLenInst.Text = "0";
            // 
            // PacketLenMin
            // 
            this.PacketLenMin.AutoSize = true;
            this.PacketLenMin.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.PacketLenMin.ForeColor = System.Drawing.Color.RoyalBlue;
            this.PacketLenMin.Location = new System.Drawing.Point(199, 53);
            this.PacketLenMin.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.PacketLenMin.Name = "PacketLenMin";
            this.PacketLenMin.Size = new System.Drawing.Size(23, 25);
            this.PacketLenMin.TabIndex = 67;
            this.PacketLenMin.Text = "0";
            // 
            // PacketLenMax
            // 
            this.PacketLenMax.AutoSize = true;
            this.PacketLenMax.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.PacketLenMax.ForeColor = System.Drawing.Color.RoyalBlue;
            this.PacketLenMax.Location = new System.Drawing.Point(199, 27);
            this.PacketLenMax.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.PacketLenMax.Name = "PacketLenMax";
            this.PacketLenMax.Size = new System.Drawing.Size(23, 25);
            this.PacketLenMax.TabIndex = 66;
            this.PacketLenMax.Text = "0";
            // 
            // FrameDelayMin
            // 
            this.FrameDelayMin.AutoSize = true;
            this.FrameDelayMin.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.FrameDelayMin.ForeColor = System.Drawing.Color.RoyalBlue;
            this.FrameDelayMin.Location = new System.Drawing.Point(199, 53);
            this.FrameDelayMin.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.FrameDelayMin.Name = "FrameDelayMin";
            this.FrameDelayMin.Size = new System.Drawing.Size(23, 25);
            this.FrameDelayMin.TabIndex = 65;
            this.FrameDelayMin.Text = "0";
            // 
            // FrameDelayMax
            // 
            this.FrameDelayMax.AutoSize = true;
            this.FrameDelayMax.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.FrameDelayMax.ForeColor = System.Drawing.Color.RoyalBlue;
            this.FrameDelayMax.Location = new System.Drawing.Point(199, 27);
            this.FrameDelayMax.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.FrameDelayMax.Name = "FrameDelayMax";
            this.FrameDelayMax.Size = new System.Drawing.Size(23, 25);
            this.FrameDelayMax.TabIndex = 64;
            this.FrameDelayMax.Text = "0";
            // 
            // FrameDelayInst
            // 
            this.FrameDelayInst.AutoSize = true;
            this.FrameDelayInst.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.FrameDelayInst.ForeColor = System.Drawing.Color.RoyalBlue;
            this.FrameDelayInst.Location = new System.Drawing.Point(199, 1);
            this.FrameDelayInst.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.FrameDelayInst.Name = "FrameDelayInst";
            this.FrameDelayInst.Size = new System.Drawing.Size(23, 25);
            this.FrameDelayInst.TabIndex = 63;
            this.FrameDelayInst.Text = "0";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label11.Location = new System.Drawing.Point(5, 265);
            this.label11.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(103, 25);
            this.label11.TabIndex = 60;
            this.label11.Text = "Packet len";
            // 
            // label8
            // 
            this.label8.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label8.Location = new System.Drawing.Point(5, 163);
            this.label8.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(226, 68);
            this.label8.TabIndex = 57;
            this.label8.Text = "Δ Time Packet received";
            // 
            // GoodPacket
            // 
            this.GoodPacket.AutoSize = true;
            this.GoodPacket.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.GoodPacket.ForeColor = System.Drawing.Color.RoyalBlue;
            this.GoodPacket.Location = new System.Drawing.Point(267, 85);
            this.GoodPacket.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.GoodPacket.Name = "GoodPacket";
            this.GoodPacket.Size = new System.Drawing.Size(23, 25);
            this.GoodPacket.TabIndex = 56;
            this.GoodPacket.Text = "0";
            // 
            // BadPacket
            // 
            this.BadPacket.AutoSize = true;
            this.BadPacket.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.BadPacket.ForeColor = System.Drawing.Color.Red;
            this.BadPacket.Location = new System.Drawing.Point(267, 111);
            this.BadPacket.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.BadPacket.Name = "BadPacket";
            this.BadPacket.Size = new System.Drawing.Size(23, 25);
            this.BadPacket.TabIndex = 56;
            this.BadPacket.Text = "0";
            // 
            // PacketDrop
            // 
            this.PacketDrop.AutoSize = true;
            this.PacketDrop.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.PacketDrop.ForeColor = System.Drawing.Color.Red;
            this.PacketDrop.Location = new System.Drawing.Point(267, 137);
            this.PacketDrop.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.PacketDrop.Name = "PacketDrop";
            this.PacketDrop.Size = new System.Drawing.Size(23, 25);
            this.PacketDrop.TabIndex = 50;
            this.PacketDrop.Text = "0";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(5, 85);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(141, 25);
            this.label1.TabIndex = 45;
            this.label1.Text = "Good Packets:";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.Location = new System.Drawing.Point(5, 137);
            this.label6.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(165, 25);
            this.label6.TabIndex = 49;
            this.label6.Text = "Packets dropped:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(5, 111);
            this.label2.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(190, 25);
            this.label2.TabIndex = 46;
            this.label2.Text = "Bad Packets (CRC):";
            // 
            // ElapseTime
            // 
            this.ElapseTime.AutoSize = true;
            this.ElapseTime.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ElapseTime.ForeColor = System.Drawing.Color.RoyalBlue;
            this.ElapseTime.Location = new System.Drawing.Point(267, 1);
            this.ElapseTime.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.ElapseTime.Name = "ElapseTime";
            this.ElapseTime.Size = new System.Drawing.Size(23, 25);
            this.ElapseTime.TabIndex = 51;
            this.ElapseTime.Text = "0";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(5, 1);
            this.label3.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(162, 25);
            this.label3.TabIndex = 49;
            this.label3.Text = "ElapseTime(ms):";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(5, 27);
            this.label4.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(93, 25);
            this.label4.TabIndex = 50;
            this.label4.Text = "DataRate";
            // 
            // StreamRateAve
            // 
            this.StreamRateAve.AutoSize = true;
            this.StreamRateAve.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.StreamRateAve.ForeColor = System.Drawing.Color.RoyalBlue;
            this.StreamRateAve.Location = new System.Drawing.Point(193, 1);
            this.StreamRateAve.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.StreamRateAve.Name = "StreamRateAve";
            this.StreamRateAve.Size = new System.Drawing.Size(23, 25);
            this.StreamRateAve.TabIndex = 52;
            this.StreamRateAve.Text = "0";
            // 
            // StreamRateInst
            // 
            this.StreamRateInst.AutoSize = true;
            this.StreamRateInst.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.StreamRateInst.ForeColor = System.Drawing.Color.RoyalBlue;
            this.StreamRateInst.Location = new System.Drawing.Point(193, 27);
            this.StreamRateInst.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.StreamRateInst.Name = "StreamRateInst";
            this.StreamRateInst.Size = new System.Drawing.Size(23, 25);
            this.StreamRateInst.TabIndex = 54;
            this.StreamRateInst.Text = "0";
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.tabPage1);
            this.tabControl1.Controls.Add(this.tabPage2);
            this.tabControl1.Location = new System.Drawing.Point(12, 31);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.Padding = new System.Drawing.Point(6, 6);
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(682, 91);
            this.tabControl1.TabIndex = 56;
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.flowLayoutPanel11);
            this.tabPage1.Location = new System.Drawing.Point(4, 31);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(674, 56);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "USB CDC / Serial";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // tabPage2
            // 
            this.tabPage2.Location = new System.Drawing.Point(4, 31);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(674, 56);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "TCP / IP";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // tableLayoutPanel2
            // 
            this.tableLayoutPanel2.CellBorderStyle = System.Windows.Forms.TableLayoutPanelCellBorderStyle.Single;
            this.tableLayoutPanel2.ColumnCount = 2;
            this.tableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 48.94895F));
            this.tableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 51.05105F));
            this.tableLayoutPanel2.Controls.Add(this.label14, 0, 0);
            this.tableLayoutPanel2.Controls.Add(this.label16, 0, 1);
            this.tableLayoutPanel2.Controls.Add(this.StreamRateInst, 1, 1);
            this.tableLayoutPanel2.Controls.Add(this.StreamRateAve, 1, 0);
            this.tableLayoutPanel2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel2.Location = new System.Drawing.Point(266, 30);
            this.tableLayoutPanel2.Name = "tableLayoutPanel2";
            this.tableLayoutPanel2.RowCount = 2;
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tableLayoutPanel2.Size = new System.Drawing.Size(398, 50);
            this.tableLayoutPanel2.TabIndex = 57;
            // 
            // label14
            // 
            this.label14.AutoSize = true;
            this.label14.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label14.Location = new System.Drawing.Point(6, -1);
            this.label14.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(86, 25);
            this.label14.TabIndex = 58;
            this.label14.Text = "Average";
            // 
            // label16
            // 
            this.label16.AutoSize = true;
            this.label16.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label16.Location = new System.Drawing.Point(5, 27);
            this.label16.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label16.Name = "label16";
            this.label16.Size = new System.Drawing.Size(135, 25);
            this.label16.TabIndex = 59;
            this.label16.Text = "Instantaneous";
            // 
            // tableLayoutPanel3
            // 
            this.tableLayoutPanel3.CellBorderStyle = System.Windows.Forms.TableLayoutPanelCellBorderStyle.Single;
            this.tableLayoutPanel3.ColumnCount = 2;
            this.tableLayoutPanel3.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 48.94895F));
            this.tableLayoutPanel3.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 51.05105F));
            this.tableLayoutPanel3.Controls.Add(this.label9, 0, 2);
            this.tableLayoutPanel3.Controls.Add(this.label5, 0, 1);
            this.tableLayoutPanel3.Controls.Add(this.label18, 0, 0);
            this.tableLayoutPanel3.Controls.Add(this.PacketLenMax, 1, 1);
            this.tableLayoutPanel3.Controls.Add(this.PacketLenInst, 1, 0);
            this.tableLayoutPanel3.Controls.Add(this.PacketLenMin, 1, 2);
            this.tableLayoutPanel3.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel3.Location = new System.Drawing.Point(266, 268);
            this.tableLayoutPanel3.Name = "tableLayoutPanel3";
            this.tableLayoutPanel3.RowCount = 3;
            this.tableLayoutPanel3.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel3.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel3.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel3.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tableLayoutPanel3.Size = new System.Drawing.Size(398, 78);
            this.tableLayoutPanel3.TabIndex = 58;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(5, 27);
            this.label5.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(50, 25);
            this.label5.TabIndex = 59;
            this.label5.Text = "Max";
            // 
            // label18
            // 
            this.label18.AutoSize = true;
            this.label18.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label18.Location = new System.Drawing.Point(5, 1);
            this.label18.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label18.Name = "label18";
            this.label18.Size = new System.Drawing.Size(135, 25);
            this.label18.TabIndex = 58;
            this.label18.Text = "Instantaneous";
            // 
            // tableLayoutPanel4
            // 
            this.tableLayoutPanel4.CellBorderStyle = System.Windows.Forms.TableLayoutPanelCellBorderStyle.Single;
            this.tableLayoutPanel4.ColumnCount = 2;
            this.tableLayoutPanel4.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 48.94895F));
            this.tableLayoutPanel4.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 51.05105F));
            this.tableLayoutPanel4.Controls.Add(this.label24, 0, 2);
            this.tableLayoutPanel4.Controls.Add(this.label22, 0, 1);
            this.tableLayoutPanel4.Controls.Add(this.label23, 0, 0);
            this.tableLayoutPanel4.Controls.Add(this.FrameDelayInst, 1, 0);
            this.tableLayoutPanel4.Controls.Add(this.FrameDelayMax, 1, 1);
            this.tableLayoutPanel4.Controls.Add(this.FrameDelayMin, 1, 2);
            this.tableLayoutPanel4.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel4.Location = new System.Drawing.Point(266, 166);
            this.tableLayoutPanel4.Name = "tableLayoutPanel4";
            this.tableLayoutPanel4.RowCount = 3;
            this.tableLayoutPanel4.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel4.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel4.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tableLayoutPanel4.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tableLayoutPanel4.Size = new System.Drawing.Size(398, 93);
            this.tableLayoutPanel4.TabIndex = 60;
            // 
            // label22
            // 
            this.label22.AutoSize = true;
            this.label22.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label22.Location = new System.Drawing.Point(5, 27);
            this.label22.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label22.Name = "label22";
            this.label22.Size = new System.Drawing.Size(50, 25);
            this.label22.TabIndex = 59;
            this.label22.Text = "Max";
            // 
            // label23
            // 
            this.label23.AutoSize = true;
            this.label23.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label23.Location = new System.Drawing.Point(5, 1);
            this.label23.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label23.Name = "label23";
            this.label23.Size = new System.Drawing.Size(135, 25);
            this.label23.TabIndex = 58;
            this.label23.Text = "Instantaneous";
            // 
            // label24
            // 
            this.label24.AutoSize = true;
            this.label24.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label24.Location = new System.Drawing.Point(5, 53);
            this.label24.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label24.Name = "label24";
            this.label24.Size = new System.Drawing.Size(44, 25);
            this.label24.TabIndex = 61;
            this.label24.Text = "Min";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label9.Location = new System.Drawing.Point(5, 53);
            this.label9.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(44, 25);
            this.label9.TabIndex = 62;
            this.label9.Text = "Min";
            // 
            // tableLayoutPanel5
            // 
            this.tableLayoutPanel5.CellBorderStyle = System.Windows.Forms.TableLayoutPanelCellBorderStyle.Single;
            this.tableLayoutPanel5.ColumnCount = 2;
            this.tableLayoutPanel5.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 48.94895F));
            this.tableLayoutPanel5.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 51.05105F));
            this.tableLayoutPanel5.Controls.Add(this.label28, 0, 3);
            this.tableLayoutPanel5.Controls.Add(this.label10, 0, 2);
            this.tableLayoutPanel5.Controls.Add(this.label12, 0, 1);
            this.tableLayoutPanel5.Controls.Add(this.AINSampleListOverflowLbl, 1, 3);
            this.tableLayoutPanel5.Controls.Add(this.label13, 0, 0);
            this.tableLayoutPanel5.Controls.Add(this.UsbOverflowLbl, 1, 0);
            this.tableLayoutPanel5.Controls.Add(this.DIOSampleListOverflowLbl, 1, 2);
            this.tableLayoutPanel5.Controls.Add(this.TcpOverflowLbl, 1, 1);
            this.tableLayoutPanel5.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel5.Location = new System.Drawing.Point(266, 355);
            this.tableLayoutPanel5.Name = "tableLayoutPanel5";
            this.tableLayoutPanel5.RowCount = 4;
            this.tableLayoutPanel5.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel5.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel5.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel5.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel5.Size = new System.Drawing.Size(398, 107);
            this.tableLayoutPanel5.TabIndex = 69;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label10.Location = new System.Drawing.Point(5, 53);
            this.label10.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(82, 25);
            this.label10.TabIndex = 62;
            this.label10.Text = "DIO List";
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label12.Location = new System.Drawing.Point(5, 27);
            this.label12.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(53, 25);
            this.label12.TabIndex = 59;
            this.label12.Text = "TCP";
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label13.Location = new System.Drawing.Point(5, 1);
            this.label13.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(53, 25);
            this.label13.TabIndex = 58;
            this.label13.Text = "USB";
            // 
            // label28
            // 
            this.label28.AutoSize = true;
            this.label28.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label28.Location = new System.Drawing.Point(5, 79);
            this.label28.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label28.Name = "label28";
            this.label28.Size = new System.Drawing.Size(80, 25);
            this.label28.TabIndex = 69;
            this.label28.Text = "AIN List";
            // 
            // label15
            // 
            this.label15.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label15.Location = new System.Drawing.Point(5, 469);
            this.label15.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label15.Name = "label15";
            this.label15.Size = new System.Drawing.Size(243, 35);
            this.label15.TabIndex = 58;
            this.label15.Text = "Δ Timestamp field";
            // 
            // tableLayoutPanel6
            // 
            this.tableLayoutPanel6.CellBorderStyle = System.Windows.Forms.TableLayoutPanelCellBorderStyle.Single;
            this.tableLayoutPanel6.ColumnCount = 2;
            this.tableLayoutPanel6.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 48.94895F));
            this.tableLayoutPanel6.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 51.05105F));
            this.tableLayoutPanel6.Controls.Add(this.label17, 0, 2);
            this.tableLayoutPanel6.Controls.Add(this.label19, 0, 1);
            this.tableLayoutPanel6.Controls.Add(this.label20, 0, 0);
            this.tableLayoutPanel6.Controls.Add(this.TimeStampInstLbl, 1, 0);
            this.tableLayoutPanel6.Controls.Add(this.TimeStampMaxLbl, 1, 1);
            this.tableLayoutPanel6.Controls.Add(this.TimeStampMinLbl, 1, 2);
            this.tableLayoutPanel6.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel6.Location = new System.Drawing.Point(266, 472);
            this.tableLayoutPanel6.Name = "tableLayoutPanel6";
            this.tableLayoutPanel6.RowCount = 3;
            this.tableLayoutPanel6.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel6.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tableLayoutPanel6.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tableLayoutPanel6.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tableLayoutPanel6.Size = new System.Drawing.Size(398, 89);
            this.tableLayoutPanel6.TabIndex = 61;
            // 
            // label17
            // 
            this.label17.AutoSize = true;
            this.label17.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label17.Location = new System.Drawing.Point(5, 53);
            this.label17.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label17.Name = "label17";
            this.label17.Size = new System.Drawing.Size(44, 25);
            this.label17.TabIndex = 61;
            this.label17.Text = "Min";
            // 
            // label19
            // 
            this.label19.AutoSize = true;
            this.label19.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label19.Location = new System.Drawing.Point(5, 27);
            this.label19.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label19.Name = "label19";
            this.label19.Size = new System.Drawing.Size(50, 25);
            this.label19.TabIndex = 59;
            this.label19.Text = "Max";
            // 
            // label20
            // 
            this.label20.AutoSize = true;
            this.label20.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label20.Location = new System.Drawing.Point(5, 1);
            this.label20.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label20.Name = "label20";
            this.label20.Size = new System.Drawing.Size(135, 25);
            this.label20.TabIndex = 58;
            this.label20.Text = "Instantaneous";
            // 
            // TimeStampInstLbl
            // 
            this.TimeStampInstLbl.AutoSize = true;
            this.TimeStampInstLbl.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.TimeStampInstLbl.ForeColor = System.Drawing.Color.RoyalBlue;
            this.TimeStampInstLbl.Location = new System.Drawing.Point(199, 1);
            this.TimeStampInstLbl.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.TimeStampInstLbl.Name = "TimeStampInstLbl";
            this.TimeStampInstLbl.Size = new System.Drawing.Size(23, 25);
            this.TimeStampInstLbl.TabIndex = 63;
            this.TimeStampInstLbl.Text = "0";
            // 
            // TimeStampMaxLbl
            // 
            this.TimeStampMaxLbl.AutoSize = true;
            this.TimeStampMaxLbl.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.TimeStampMaxLbl.ForeColor = System.Drawing.Color.RoyalBlue;
            this.TimeStampMaxLbl.Location = new System.Drawing.Point(199, 27);
            this.TimeStampMaxLbl.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.TimeStampMaxLbl.Name = "TimeStampMaxLbl";
            this.TimeStampMaxLbl.Size = new System.Drawing.Size(23, 25);
            this.TimeStampMaxLbl.TabIndex = 64;
            this.TimeStampMaxLbl.Text = "0";
            // 
            // TimeStampMinLbl
            // 
            this.TimeStampMinLbl.AutoSize = true;
            this.TimeStampMinLbl.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.TimeStampMinLbl.ForeColor = System.Drawing.Color.RoyalBlue;
            this.TimeStampMinLbl.Location = new System.Drawing.Point(199, 53);
            this.TimeStampMinLbl.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.TimeStampMinLbl.Name = "TimeStampMinLbl";
            this.TimeStampMinLbl.Size = new System.Drawing.Size(23, 25);
            this.TimeStampMinLbl.TabIndex = 65;
            this.TimeStampMinLbl.Text = "0";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(837, 718);
            this.Controls.Add(this.tabControl1);
            this.Controls.Add(this.tableLayoutPanel1);
            this.Controls.Add(this.statusStrip1);
            this.Controls.Add(this.menuStrip1);
            this.Controls.Add(this.runBtn);
            this.Controls.Add(this.stopBtn);
            this.DoubleBuffered = true;
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MainMenuStrip = this.menuStrip1;
            this.Margin = new System.Windows.Forms.Padding(4);
            this.MaximizeBox = false;
            this.Name = "Form1";
            this.Text = "Nyquist Comm Test";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.Form1_FormClosing);
            this.flowLayoutPanel11.ResumeLayout(false);
            this.flowLayoutPanel11.PerformLayout();
            this.statusStrip1.ResumeLayout(false);
            this.statusStrip1.PerformLayout();
            this.contextMenuStrip1.ResumeLayout(false);
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.tableLayoutPanel1.ResumeLayout(false);
            this.tableLayoutPanel1.PerformLayout();
            this.tabControl1.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.tableLayoutPanel2.ResumeLayout(false);
            this.tableLayoutPanel2.PerformLayout();
            this.tableLayoutPanel3.ResumeLayout(false);
            this.tableLayoutPanel3.PerformLayout();
            this.tableLayoutPanel4.ResumeLayout(false);
            this.tableLayoutPanel4.PerformLayout();
            this.tableLayoutPanel5.ResumeLayout(false);
            this.tableLayoutPanel5.PerformLayout();
            this.tableLayoutPanel6.ResumeLayout(false);
            this.tableLayoutPanel6.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.FlowLayoutPanel flowLayoutPanel11;
        private System.Windows.Forms.Label label25;
        private System.Windows.Forms.ComboBox BaudRateCbx;
        private System.Windows.Forms.Label label26;
        private System.Windows.Forms.ComboBox PortCbx;
        private System.Windows.Forms.Button RefreshBtn;
        private System.Windows.Forms.Button ConnectBtn;
        private System.IO.Ports.SerialPort serialPort1;
        private System.Windows.Forms.StatusStrip statusStrip1;
        private System.Windows.Forms.ToolStripStatusLabel StatusLbl;
        private System.Windows.Forms.Button DisconnectBtn;
        private System.Windows.Forms.Timer timer1;
        private System.Windows.Forms.ContextMenuStrip contextMenuStrip1;
        private System.Windows.Forms.ToolStripMenuItem clearToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem copyAllToolStripMenuItem;
        private System.Windows.Forms.ToolStripStatusLabel toolStripStatusLabel1;
        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem txSettingToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem startStreamingCmd;
        private System.Windows.Forms.ToolStripMenuItem txEnabledToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem saveAsMenuItem;
        private System.Windows.Forms.SaveFileDialog saveFileDialog1;
        private System.Windows.Forms.Button runBtn;
        private System.Windows.Forms.Button stopBtn;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private System.Windows.Forms.Label ElapseTime;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label PacketDrop;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label StreamRateAve;
        private System.Windows.Forms.Label StreamRateInst;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label BadPacket;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label GoodPacket;
        private System.Windows.Forms.Label PacketLenInst;
        private System.Windows.Forms.Label PacketLenMin;
        private System.Windows.Forms.Label PacketLenMax;
        private System.Windows.Forms.Label FrameDelayMin;
        private System.Windows.Forms.Label FrameDelayMax;
        private System.Windows.Forms.Label FrameDelayInst;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.TabControl tabControl1;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.ToolStripMenuItem stopStreamingCmd;
        private System.Windows.Forms.Label TcpOverflowLbl;
        private System.Windows.Forms.Label UsbOverflowLbl;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label DIOSampleListOverflowLbl;
        private System.Windows.Forms.Label AINSampleListOverflowLbl;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel5;
        private System.Windows.Forms.Label label28;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel3;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label18;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel4;
        private System.Windows.Forms.Label label24;
        private System.Windows.Forms.Label label22;
        private System.Windows.Forms.Label label23;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel2;
        private System.Windows.Forms.Label label16;
        private System.Windows.Forms.Label label14;
        private System.Windows.Forms.Label label15;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel6;
        private System.Windows.Forms.Label label17;
        private System.Windows.Forms.Label label19;
        private System.Windows.Forms.Label label20;
        private System.Windows.Forms.Label TimeStampInstLbl;
        private System.Windows.Forms.Label TimeStampMaxLbl;
        private System.Windows.Forms.Label TimeStampMinLbl;
    }
}

