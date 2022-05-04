@echo off
cls
Echo Copying Icons to %HOMEDRIVE%%HOMEPATH%\Documents\DAECLI\Icons
md %HOMEDRIVE%%HOMEPATH%\Documents\DAECLI
md %HOMEDRIVE%%HOMEPATH%\Documents\DAECLI\Icons
Copy *.ico %HOMEDRIVE%%HOMEPATH%\Documents\DAECLI\Icons
Echo Generating Batch files and Copying them to %HOMEDRIVE%%HOMEPATH%\Documents\DAECLI\Batch
md %HOMEDRIVE%%HOMEPATH%\Documents\DAECLI\Batch
call Generate.bat
for %%a in (".\*.bat") do (
    rem check if the file has an extension and if it is not our script
    if "%%~xa" NEQ ""  if "%%~dpnxa" NEQ "%~dpnx0" (
        rem check if extension forlder exists, if not it is created
        rem Copy (or change to move) the file to directory
        move "%%a" "%HOMEDRIVE%%HOMEPATH%\Documents\DAECLI\Batch"
    )
)
Echo Generating shortcuts for Styles.
@echo off
md %HOMEDRIVE%%HOMEPATH%\Desktop\DAE-CLI
for /F "tokens=*" %%A in (styles.txt) do (
echo Set oWS = WScript.CreateObject^("WScript.Shell"^) > CreateShortcut.vbs
echo sLinkFile = "%HOMEDRIVE%%HOMEPATH%\Desktop\DAE-CLI\%%A.lnk" >> CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut^(sLinkFile^)  >> CreateShortcut.vbs
echo oLink.TargetPath = "%HOMEDRIVE%%HOMEPATH%\Documents\DAECLI\Batch\%%A.bat"  >> CreateShortcut.vbs
echo oLink.Description = "Deep Art Effects CLI v1.2.7 - Style %%A"  >> CreateShortcut.vbs
echo oLink.IconLocation = "%HOMEDRIVE%%HOMEPATH%\Documents\DAECLI\Icons\%%A.ico" >> CreateShortcut.vbs
echo oLink.WorkingDirectory = "%HOMEDRIVE%%HOMEPATH%\Desktop" >> CreateShortcut.vbs
echo oLink.Save >> CreateShortcut.vbs
cscript CreateShortcut.vbs
Echo Shortcut Created for Style - %%A in folder %HOMEDRIVE%%HOMEPATH%\Desktop\DAE-CLI
del CreateShortcut.vbs
)
Echo installation complete please go to %HOMEDRIVE%%HOMEPATH%\Desktop\DAE-CLI drag a image to a shortcut to generate your desired styles.
Pause