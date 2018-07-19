param([String]$Filename,[String]$Release,[String]$Enviropment,[String]$runCommand)
echo "Prepare and Archive Distributive for $Release enviropment to $Filename"
cd Expedia.Core.Node
npm install -f --production
npm run build:$runCommand
cd ..
& "C:\Program Files\7-Zip\7z.exe" a -r $Filename Expedia.Core.Node
Move-Item $Filename c:\AutoDeploy\ftp_root
Remove-Item -force c:\AutoDeploy\ftp_root\Expedia.Front.Last.$Enviropment
cmd.exe /c mklink c:\AutoDeploy\ftp_root\Expedia.Front.Last.$Enviropment c:\AutoDeploy\ftp_root\$Filename
