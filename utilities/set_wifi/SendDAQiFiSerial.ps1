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
Start-Sleep -Milliseconds 2000 #wait 2 seconds

Write-Host "Writing WiFi Settings"
$port.WriteLine('SYSTem:COMMunicate:LAN:NETType 1')
Start-Sleep -Milliseconds 100 #wait 0.1 seconds

$port.WriteLine('SYSTem:COMMunicate:LAN:SSID Doranix')
Start-Sleep -Milliseconds 100 #wait 0.1 seconds

$port.WriteLine('SYSTem:COMMunicate:LAN:SECurity 3')
Start-Sleep -Milliseconds 100 #wait 0.1 seconds

$port.WriteLine('SYSTem:COMMunicate:LAN:PASs Cooie001')
Start-Sleep -Milliseconds 100 #wait 0.1 seconds

$port.WriteLine('SYSTem:COMMunicate:LAN:APPLY')
Start-Sleep -Milliseconds 100 #wait 0.1 seconds

$port.WriteLine('SYSTem:COMMunicate:LAN:SAVE')
Start-Sleep -Milliseconds 100 #wait 0.1 seconds

# Rebooting should be no longer necessary after applying network settings

Write-Host "Rebooting"
$port.WriteLine('SYSTem:REBOOT')

Write-Host "Closing Connection."
$port.close() #close serial connection

Write-Host "Waiting for COM port..."
do{
	Start-Sleep -Milliseconds 1000 #wait 1 seconds
	$port.open()
}
while($port.IsOpen -ne 1)

Write-Host "Opening Connection..."

Write-Host "Powering on."
$port.WriteLine('SYSTem:POWer:STATe 1')
Start-Sleep -Milliseconds 2000 #wait 2 seconds

Write-Host "Enabling all ADC channels."
$port.WriteLine('CONFigure:ADC:CHANnel 0,1')
Start-Sleep -Milliseconds 100 #wait 0.1 seconds

$port.WriteLine('CONFigure:ADC:CHANnel 1,1')
Start-Sleep -Milliseconds 100 #wait 0.1 seconds

$port.WriteLine('CONFigure:ADC:CHANnel 2,1')
Start-Sleep -Milliseconds 100 #wait 0.1 seconds

$port.WriteLine('CONFigure:ADC:CHANnel 3,1')
Start-Sleep -Milliseconds 100 #wait 0.1 seconds

$port.WriteLine('CONFigure:ADC:CHANnel 4,1')
Start-Sleep -Milliseconds 100 #wait 0.1 seconds

$port.WriteLine('CONFigure:ADC:CHANnel 5,1')
Start-Sleep -Milliseconds 100 #wait 0.1 seconds

$port.WriteLine('CONFigure:ADC:CHANnel 6,1')
Start-Sleep -Milliseconds 100 #wait 0.1 seconds

$port.WriteLine('CONFigure:ADC:CHANnel 7,1')
Start-Sleep -Milliseconds 100 #wait 0.1 seconds

$port.WriteLine('CONFigure:ADC:CHANnel 8,1')
Start-Sleep -Milliseconds 100 #wait 0.1 seconds

$port.WriteLine('CONFigure:ADC:CHANnel 9,1')
Start-Sleep -Milliseconds 100 #wait 0.1 seconds

$port.WriteLine('CONFigure:ADC:CHANnel 10,1')
Start-Sleep -Milliseconds 100 #wait 0.1 seconds

$port.WriteLine('CONFigure:ADC:CHANnel 11,1')
Start-Sleep -Milliseconds 100 #wait 0.1 seconds

$port.WriteLine('CONFigure:ADC:CHANnel 12,1')
Start-Sleep -Milliseconds 100 #wait 0.1 seconds

$port.WriteLine('CONFigure:ADC:CHANnel 13,1')
Start-Sleep -Milliseconds 100 #wait 0.1 seconds

$port.WriteLine('CONFigure:ADC:CHANnel 14,1')
Start-Sleep -Milliseconds 100 #wait 0.1 seconds

$port.WriteLine('CONFigure:ADC:CHANnel 15,1')
Start-Sleep -Milliseconds 100 #wait 0.1 seconds

Write-Host "Closing Connection."
$port.close() #close serial connection

Write-Host "Done."



