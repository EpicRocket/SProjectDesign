Set-Variable -Name "ClientName" -Value "Client"
Set-Variable -Name "ProjectName" -Value "SProject"

if (-not (Test-Path $ClientName)) {
    Write-Output "Not found Unreal Engine... please run Install.bat"
    Stop-Process -Id $PID
}

Push-Location $ClientName

if (-not (Test-Path "GenerateProjectFiles.bat")) {
    Write-Output "Not install Unreal Engine... please checking folder"
    Stop-Process -Id $PID
}

if (-not (Test-Path $ProjectName)) {
    Write-Output "Create $ProjectName folder..."
    New-Item -ItemType Directory -Name $ProjectName
}

Push-Location $ProjectName

if (-not (Test-Path ".\.git")) {
    Write-Output "Git Clone SProject"
    Pop-Location
    git clone https://github.com/dek0058/SProject.git $ProjectName
    Push-Location $ProjectName

    git submodule update --init --recursive
}

Pop-Location

Write-Output "Generate Project Files..."
Start-Process -FilePath GenerateProjectFiles.bat -Wait

Write-Output "$ProjectName create Complete!"
