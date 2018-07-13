$ErrorActionPreference = 'SilentlyContinue'
#Create SerialPort and Configure
$port = New-Object System.IO.Ports.SerialPort
$port.PortName = "COM3"
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

Write-Host "Enabling DIO channels..."

$port.WriteLine("DIO:PORt:ENAble 1")
Start-Sleep -Milliseconds 100 #wait 0.1 seconds
$port.WriteLine("DIO:PORt:DIRection 65535")
Start-Sleep -Milliseconds 100 #wait 0.1 seconds
$port.WriteLine("DIO:PORt:state 65535")
Start-Sleep -Milliseconds 100 #wait 0.1 seconds

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


$names = "ADC_CHANNEL_VSYS","ADC_CHANNEL_5VREF","ADC_CHANNEL_3_3V","ADC_CHANNEL_2_5VREF","ADC_CHANNEL_VBATT","ADC_CHANNEL_5V","ADC_CHANNEL_10V","ADC_CHANNEL_TEMP"
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
Write-Host ""

#Set DIO ports as inouts
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

Write-Host "Writing DIO channels..."
$port.WriteLine("DIO:PORt:DIRection 65535")
Start-Sleep -Milliseconds 100 #wait 0.1 seconds
$port.WriteLine("DIO:PORt:STATe 65535")
Start-Sleep -Milliseconds 1000 #wait 1 seconds
$port.WriteLine("DIO:PORt:STATe 0")
Start-Sleep -Milliseconds 100 #wait 0.1 seconds

For ($i=0; $i -lt 16; $i++)
{
    $data = [string]::Format("DIO:PORt:STATe {0}, 1",$i)
    $port.WriteLine($data)
    Start-Sleep -Milliseconds 100 #wait 0.2 seconds
    $data = [string]::Format("DIO:PORt:STATe {0}, 0",$i)
    $port.WriteLine($data)
    Start-Sleep -Milliseconds 100 #wait 0.2 seconds
}
$port.DiscardInBuffer();

#Set DIO ports as inouts
$port.WriteLine("DIO:PORt:DIRection 0")
Start-Sleep -Milliseconds 100 #wait 0.1 seconds

Write-Host "Closing Connection."
$port.close() #close serial connection

Write-Host "Done."