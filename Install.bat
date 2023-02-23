@ECHO OFF

@SETLOCAL

ECHO Powershell run to "UnrealEngineInstall.ps1"
PowerShell -ExecutionPolicy Bypass -File "./UnrealEngineInstall.ps1"

ECHO Powershell run to "ClientProjectInstall.ps1"
PowerShell -ExecutionPolicy Bypass -File "./ClientProjectInstall.ps1"

ECHO Install Complete...

PAUSE
