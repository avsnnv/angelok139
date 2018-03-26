param([String]$Filename,[String]$Release,[String]$Enviropment)

echo "Prepare and Archive Distributive for $Release enviropment to $Filename"
cd Expedia.Core.Node
npm install -f
npm run build:beta
cd ..
& "C:\Program Files\7-Zip\7z.exe" a -r $Filename Expedia.Core.Api
& "C:\Program Files\7-Zip\7z.exe" a -r $Filename Expedia.Core.Node
copy $Filename c:\AutoDeploy\ftp_root
Remove-Item -force c:\AutoDeploy\ftp_root\Expedia.Last.$Enviropment
cmd.exe /c mklink c:\AutoDeploy\ftp_root\Expedia.Last.$Enviropment c:\AutoDeploy\ftp_root\$Filename

