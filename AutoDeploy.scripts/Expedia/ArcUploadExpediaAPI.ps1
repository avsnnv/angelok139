param([String]$Filename,[String]$Release,[String]$Enviropment)

echo "Prepare and Archive Expedia API for $Release enviropment to $Filename"
cd Expedia.Core.Api
Remove-Item -force Web.config
Copy-Item Web.$Release.config Web.config
cd ..

Compress-Archive -Path Expedia.Core.Api\ -destinationPath $Filename -CompressionLevel Optimal
Move-Item $Filename c:\AutoDeploy\ftp_root
Remove-Item -force c:\AutoDeploy\ftp_root\Expedia.Api.Last.$Enviropment
cmd.exe /c mklink c:\AutoDeploy\ftp_root\Expedia.Api.Last.$Enviropment c:\AutoDeploy\ftp_root\$Filename

