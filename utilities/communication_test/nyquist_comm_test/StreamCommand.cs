using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Collections;

namespace Serial_Port_Logger
{
    public partial class StreamCommand : Form
    {
        Form1 myparent;
        bool isStartStreamCommand = false;

        public StreamCommand()
        {
            InitializeComponent();
        }

        public StreamCommand(Form1 parent, bool isStart)
        {
            myparent = parent;
            isStartStreamCommand = isStart;
            InitializeComponent();

            if (isStartStreamCommand)
            {
                StreamCommandTb.Text = myparent.startStreamCommands;
            }
            else
            {
                StreamCommandTb.Text = myparent.stopStreamCommands;
            }
        }


        private void OK_Btn_Click(object sender, EventArgs e)
        {
            if (isStartStreamCommand)
            {
                myparent.startStreamCommands = StreamCommandTb.Text;
                Properties.Settings.Default.startstreamcommand = StreamCommandTb.Text;
            }
            else
            {
                myparent.stopStreamCommands = StreamCommandTb.Text;
                Properties.Settings.Default.stopstreamcommand = StreamCommandTb.Text;
            }
            Properties.Settings.Default.Save();
            this.Close();
        }

        private void Cancel_Btn_Click(object sender, EventArgs e)
        {
            this.Close();
        }


    }
}
