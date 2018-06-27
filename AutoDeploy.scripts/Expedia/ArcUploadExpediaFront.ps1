param([String]$Filename,[String]$Release,[String]$Enviropment,[String]$runCommand)
echo "Prepare and Archive Distributive for $Release enviropment to $Filename"
npm install -f
npm run build:$runCommand
& "C:\Program Files\7-Zip\7z.exe" a -r $Filename *
Move-Item $Filename c:\AutoDeploy\ftp_root
Remove-Item -force c:\AutoDeploy\ftp_root\Expedia.Front.Last.$Enviropment
cmd.exe /c mklink c:\AutoDeploy\ftp_root\Expedia.Front.Last.$Enviropment c:\AutoDeploy\ftp_root\$Filename
