param([String]$server,[String]$Filename,[String]$ftpUser,[String]$ftpPass)

echo "Begin Download and Extract $Filename on $server"

Invoke-Command -ComputerName $server -FilePath Scripts/LocalDownloadExtract.ps1 -ArgumentList $Filename,$ftpUser,$ftpPass

