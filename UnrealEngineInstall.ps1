
Set-Variable -Name "ClientName" -Value "Client"

# Check if Client folder exists
if (-not (Test-Path $ClientName)) {
    Write-Output "Create $ClientName folder..."
    New-Item -ItemType Directory -Name $ClientName
}

Push-Location $ClientName

if (-not (Test-Path ".\.git")) {
    Write-Output "Git Clone UnrealEngine5.1..."
    Pop-Location
    git clone https://github.com/dek0058/UnrealEngine5.1.git $ClientName
    Push-Location $ClientName
}

if (-not (Test-Path "Setup.bat")) {
    Write-Output "Not install Unreal Engine... please checking folder"
    Stop-Process -Id $PID
}

Write-Output "Unreal Engine Install..."
Start-Process -FilePath Setup.bat -ArgumentList "--force" -Wait

Write-Output "Unreal Engine Install Complete!"
