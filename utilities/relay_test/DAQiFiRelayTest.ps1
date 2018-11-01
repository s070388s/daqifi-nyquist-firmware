$ErrorActionPreference = 'SilentlyContinue'
$DELAY = 1000

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
Start-Sleep -Milliseconds 2000 #wait 2 seconds

Write-Host "Writing relay DIO channel directions..."
$port.WriteLine("DIO:PORt:DIRection 240")
Start-Sleep -Milliseconds 100 #wait 0.1 seconds

Do
{

Write-Host "Writing relay DIO channel 0 on..."
$port.WriteLine("DIO:PORt:STATe 16")
Start-Sleep -Milliseconds $DELAY #wait 1 seconds

Write-Host "Writing relay DIO channel 0 off..."
$port.WriteLine("DIO:PORt:STATe 0")
Start-Sleep -Milliseconds $DELAY #wait 1 seconds

Write-Host "Writing relay DIO channel 1 on..."
$port.WriteLine("DIO:PORt:STATe 32")
Start-Sleep -Milliseconds $DELAY #wait 1 seconds

Write-Host "Writing relay DIO channel 1 off..."
$port.WriteLine("DIO:PORt:STATe 0")
Start-Sleep -Milliseconds $DELAY #wait 1 seconds

Write-Host "Writing relay DIO channel 2 on..."
$port.WriteLine("DIO:PORt:STATe 64")
Start-Sleep -Milliseconds $DELAY #wait 1 seconds

Write-Host "Writing relay DIO channel 2 off..."
$port.WriteLine("DIO:PORt:STATe 0")
Start-Sleep -Milliseconds $DELAY #wait 1 seconds

Write-Host "Writing relay DIO channel 3 on..."
$port.WriteLine("DIO:PORt:STATe 128")
Start-Sleep -Milliseconds $DELAY #wait 1 seconds

Write-Host "Writing relay DIO channel 3 off..."
$port.WriteLine("DIO:PORt:STATe 0")
Start-Sleep -Milliseconds $DELAY #wait 1 seconds

} While (1)

Write-Host "Closing Connection."
$port.close() #close serial connection

Write-Host "Done."



