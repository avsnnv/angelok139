param([String]$Filename,[String]$Release,[String]$Enviropment,$runCommand)

echo "Prepare and Archive Expedia GUI for $Release enviropment to $Filename"
cd Expedia.Core.Node
npm install -f
npm run build:$runCommand
cd ..
& "C:\Program Files\7-Zip\7z.exe" a -tzip -r $Filename Expedia.Core.Node
Move-Item $Filename c:\AutoDeploy\ftp_root
Remove-Item -force c:\AutoDeploy\ftp_root\Expedia.Node.Last.$Enviropment
cmd.exe /c mklink c:\AutoDeploy\ftp_root\Expedia.Node.Last.$Enviropment c:\AutoDeploy\ftp_root\$Filename

