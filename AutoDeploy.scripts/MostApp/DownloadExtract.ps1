param([String]$server,[String]$Filename,[String]$ftpUser,[String]$ftpPass)

echo "Begin Download and Extract $Filename on $server"

Invoke-Command -ComputerName $server -ScriptBlock { param($Filename,$ftpUser,$ftpPass)
Remove-Item -Recurse -Force c:\temp
New-Item c:\temp -ItemType Directory

ncftpget -u $ftpUser -p $ftpPass testserver1.mostapp.com c:\temp\ $Filename
cd c:\temp\

& "C:\Program Files\7-Zip\7z" x c:\temp\$Filename -oc:\temp\ -y

} -Args $Filename,$ftpUser,$ftpPass
