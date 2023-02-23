Set-Variable -Name "ClientName" -Value "Client"
Set-Variable -Name "ProjectName" -Value "SProject"

if (-not (Test-Path $ClientName)) {
    Write-Output "Not found Unreal Engine... please run Install.bat"
    Exit-PSSession
}

Push-Location $ClientName

if (-not (Test-Path "GenerateProjectFiles.bat")) {
    Write-Output "Not install Unreal Engine... please checking folder"
    Exit-PSSession
}

if (-not (Test-Path $ProjectName)) {
    Write-Output "Create $ProjectName folder..."
    New-Item -ItemType Directory -Name $SProject
}

Push-Location $ProjectName

if (-not (Test-Path ".\.git")) {
    Write-Output "Git Clone SProject"
    Pop-Location
    git clone https://github.com/dek0058/SProject.git $ClientName
}

Pop-Location

Write-Output "Generate Project Files..."
call GenerateProjectFiles.bat

Write-Output "$ProjectName create Complete!"
