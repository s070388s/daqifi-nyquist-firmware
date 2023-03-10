echo off

SET projectDir=%1
SET inputDir=%projectDir%\..\src\nanopb

REM Process each proto and options file by using ProtobufOperations.bat
FOR %%i IN (%inputDir%\*.proto) DO %~dp0\ProtobufOperations.bat %projectDir% %%~ni%%~xi