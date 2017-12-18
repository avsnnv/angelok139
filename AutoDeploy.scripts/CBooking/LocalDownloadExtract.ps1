param($Filename,$ftpUser,$ftpPass)
Remove-Item -Recurse -Force c:\temp
New-Item c:\temp -ItemType Directory

ncftpget -u $ftpUser -p $ftpPass testserver1.mostapp.com c:\temp\ $Filename
cd c:\temp\

& "C:\Program Files\7-Zip\7z" x c:\temp\$Filename -oc:\temp\ -y

