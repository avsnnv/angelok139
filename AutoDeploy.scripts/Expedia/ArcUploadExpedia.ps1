param([String]$Filename,[String]$Release,[String]$Enviropment,[String]$runCommand)

echo "Prepare and Archive Distributive for $Release enviropment to $Filename"
cd Expedia.Core.Node
npm install -f
npm run build:$runCommand
cd ..\Expedia.Core.Api
Remove-Item -force Web.config
Copy-Item Web.$Release.config Web.config
cd ..

& "C:\Program Files\7-Zip\7z.exe" a -r $Filename Expedia.Core.Api
& "C:\Program Files\7-Zip\7z.exe" a -r $Filename Expedia.Core.Node
copy $Filename c:\AutoDeploy\ftp_root
Remove-Item -force c:\AutoDeploy\ftp_root\Expedia.Last.$Enviropment
cmd.exe /c mklink c:\AutoDeploy\ftp_root\Expedia.Last.$Enviropment c:\AutoDeploy\ftp_root\$Filename

