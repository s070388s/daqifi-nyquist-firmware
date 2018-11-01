echo off

SET projectDir=%1
SET inputDir=%projectDir%\..\src\web_pages
SET outputDir=%projectDir%\..\src
SET toolDir=%projectDir%\..\..\..\..\utilities

IF NOT EXIST %outputDir% MKDIR %outputDir%
java -jar %toolDir%\mpfs_generator\mpfs2.jar /PIC32 %inputDir% %outputDir% mpfs_img2.c
