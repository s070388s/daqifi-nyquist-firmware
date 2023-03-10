echo off

SET projectDir=%1

call %projectDir%\..\GenerateDiskImage.bat "%projectDir%"
call %projectDir%\..\GenerateProtobuf.bat "%projectDir%"