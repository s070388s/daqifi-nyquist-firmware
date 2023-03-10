$ErrorActionPreference = 'SilentlyContinue'

$portNum = Read-Host -Prompt 'Enter COM port number'

#Create SerialPort and Configure
$port = New-Object System.IO.Ports.SerialPort
$port.PortName = "COM$portNum"
$port.BaudRate = "9600"
$port.Parity = "None"
$port.DataBits = 8
$port.StopBits = 1
$port.DtrEnable = 1
$port.ReadTimeout = 2000 #Milliseconds

Write-Host "Waiting for COM port..."
do{
	$port.open()
}
while($port.IsOpen -ne 1)

Write-Host "Opening Connection..."
Start-Sleep -Milliseconds 100 #wait 0.1 seconds

Write-Host "Powering on."
$port.WriteLine('SYSTem:POWer:STATe 1')
Start-Sleep -Milliseconds 3000 #wait 3 seconds


$port.DiscardInBuffer();

Write-Host "Enabling AIn channels..."
For ($i=0; $i -lt 16; $i++)
{
    $data = [string]::Format("CONFigure:ADC:CHANnel {0}, 1",$i)
    $port.WriteLine($data)
    Start-Sleep -Milliseconds 10 #wait 0.01 seconds
    $data = $port.ReadLine();
    #Discard echoed command
    #Write-Host($data);
}

Write-Host "Reading AIn channels..."
Write-Host ""

For ($i=0; $i -lt 16; $i++)
{
    $data = [string]::Format("MEASure:VOLTage:DC? {0}",$i)
    $port.WriteLine($data)
    Start-Sleep -Milliseconds 10 #wait 0.01 seconds
    $data = $port.ReadLine();
    #Discard echoed command
    #Write-Host($data);
    $data = $port.ReadLine();
    Write-Host($i,":`t", $data);
}


$names = "ADC_CHANNEL_VSYS","ADC_CHANNEL_5VREF","ADC_CHANNEL_3_3V","ADC_CHANNEL_2_5VREF","ADC_CHANNEL_VBATT","ADC_CHANNEL_5_5V","ADC_CHANNEL_10V","ADC_CHANNEL_TEMP"
For ($i=0; $i -lt 8; $i++)
{
    $data = [string]::Format("MEASure:VOLTage:DC? {0}",$i+248)
    $port.WriteLine($data)
    Start-Sleep -Milliseconds 10 #wait 0.01 seconds
    $data = $port.ReadLine();
    #Discard echoed command
    #Write-Host($data);
    $data = $port.ReadLine();
    Write-Host($names[$i],":`t", $data);
}

Start-Sleep -Milliseconds 100 #wait 0.1 seconds

Write-Host ""
Write-Host "Reading DIO channels..."
Write-Host "should return 0"
Write-Host ""

#Set DIO ports as inputs
$port.WriteLine("DIO:PORt:DIRection 0")
Start-Sleep -Milliseconds 100 #wait 0.1 seconds
$port.WriteLine("DIO:PORt:STATe 0")
Start-Sleep -Milliseconds 1000 #wait 1 seconds

$port.DiscardInBuffer();
$port.WriteLine("DIO:PORt:STATe?")
Start-Sleep -Milliseconds 100 #wait 0.1 seconds
# Discard echoed command
$data = $port.ReadLine();
$data = $port.ReadLine();
Write-Host($data);
Write-Host ""

Write-Host ""
Write-Host "Connect DIO null adapter..."
Read-Host "then press ENTER"
Write-Host ""

Write-Host "Writing even DIO channels..."
Write-Host "(should return 65535)"
$port.WriteLine("DIO:PORt:DIRection 21845")
Start-Sleep -Milliseconds 100 #wait 0.1 seconds
$port.WriteLine("DIO:PORt:STATe 21845")
Start-Sleep -Milliseconds 100 #wait 1 seconds
$port.DiscardInBuffer();
$port.WriteLine("DIO:PORt:STATe?")
Start-Sleep -Milliseconds 100 #wait 0.1 seconds
# Discard echoed command
$data = $port.ReadLine();
$data = $port.ReadLine();
Write-Host($data);
Write-Host([convert]::ToString($data,2)) #show output in binary

Read-Host "then press ENTER"

Write-Host "Writing odd DIO channels..."
Write-Host "(should return 65535)"
$port.WriteLine("DIO:PORt:DIRection 43690")
Start-Sleep -Milliseconds 100 #wait 0.1 seconds
$port.WriteLine("DIO:PORt:STATe 43690")
Start-Sleep -Milliseconds 100 #wait 1 seconds
$port.DiscardInBuffer();
$port.WriteLine("DIO:PORt:STATe?")
Start-Sleep -Milliseconds 100 #wait 0.1 seconds
# Discard echoed command
$data = $port.ReadLine();
$data = $port.ReadLine();
Write-Host($data);
Write-Host([convert]::ToString($data,2)) #show output in binary

$port.WriteLine("DIO:PORt:STATe 0")
Start-Sleep -Milliseconds 100 #wait 0.1 seconds
$port.WriteLine("DIO:PORt:DIRection 0")
Start-Sleep -Milliseconds 100 #wait 0.1 seconds

# Toggle DIO ports in sequence
# For ($i=0; $i -lt 16; $i++)
# {
    # $data = [string]::Format("DIO:PORt:STATe {0}, 1",$i)
    # $port.WriteLine($data)
    # Start-Sleep -Milliseconds 100 #wait 0.2 seconds
    # $data = [string]::Format("DIO:PORt:STATe {0}, 0",$i)
    # $port.WriteLine($data)
    # Start-Sleep -Milliseconds 100 #wait 0.2 seconds
# }
# $port.DiscardInBuffer();

#Set DIO ports as inputs
$port.WriteLine("DIO:PORt:DIRection 0")
Start-Sleep -Milliseconds 100 #wait 0.1 seconds

Write-Host "Closing Connection."
$port.close() #close serial connection

Write-Host "Done."