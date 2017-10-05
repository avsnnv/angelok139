param([String]$server,[String]$Release)
echo "Install Services on $server release $Release"

Invoke-Command -ComputerName $server -ScriptBlock {
param([String]$Release)


Get-Service -Name Core* | Stop-Service

C:\Windows\Microsoft.NET\Framework64\v4.0.30319\installUtil.exe /u C:\CoreServices\bin\Most.Core.API.Services.exe

cd c:\temp\Most.Core\Most.Core.API.Services\bin\$Release
robocopy . C:\CoreServices\bin /e /XD "References"
cd References
robocopy . C:\CoreServices\References /e
C:\Windows\Microsoft.NET\Framework64\v4.0.30319\installUtil.exe C:\CoreServices\bin\Most.Core.API.Services.exe
Get-Service -Name Core* | Start-Service 

} -ArgumentList $Release