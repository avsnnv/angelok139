param([String]$server,[String]$Filename)

echo "Begin Download and Extract $Filename on $server"

Invoke-Command -ComputerName $server -ScriptBlock { param($Filename)
Remove-Item -Recurse -Force c:\temp
New-Item c:\temp -ItemType Directory

ncftpget -u teamcity -p Qq111111 testserver1.mostapp.com c:\temp\ $Filename
cd c:\temp\

& "C:\Program Files\7-Zip\7z" x c:\temp\$Filename -oc:\temp\ -y

} -Args $Filename