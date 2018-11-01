echo off

SET projectDir=%1
SET fileName=%2
SET fileNameNoExt=%~n2
SET inputDir=%projectDir%\..\src\nanopb
SET outputDir=%projectDir%\..\src\nanopb
SET protocExe=%projectDir%\..\..\nanopb\generator-bin\protoc.exe
SET protocInclude=-I..\generator\proto -I..\generator\proto\google\protobuf

REM Copy proto and options file into protoc directory
REM because protoc has a bug where it will not pass an options file path and propcess the options file
copy %inputDir%\%fileName% %projectDir%\..\..\nanopb\generator-bin\ /Y
copy %inputDir%\%fileNameNoExt%.options %projectDir%\..\..\nanopb\generator-bin\ /Y

REM Change to protoc directory
cd %projectDir%\..\..\nanopb\generator-bin\

REM Run protoc and place output files in our proper project folder
protoc %protocInclude% --proto_path=%cd% --nanopb_out=%outputDir% %cd%\%fileName%
protoc %protocInclude% --proto_path=%cd% --descriptor_set_out=%outputDir%\%fileName%comp %cd%\%fileName%

REM Remove temporary files
del %fileName%
del %fileNameNoExt%.options

REM Change back to original directory
cd %~dp0