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
del CreateShortcut.vbs
)
