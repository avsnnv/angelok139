param($Filename,[String]$Release)

echo "Prepare and Archive Distributive ElmaWCF for $Release enviropment to $Filename"

Remove-Item -force WcfElma\Web.config
Copy-Item WcfElma\Web.$Release.config WcfElma\Web.config
Remove-Item -force Most.BusinessCore.System1CIntegration\Web.config
Copy-Item Most.BusinessCore.System1CIntegration\Web.$Release.config Most.BusinessCore.System1CIntegration\Web.config

& "C:\Program Files\7-Zip\7z.exe" a -r $Filename WcfElma
& "C:\Program Files\7-Zip\7z.exe" a -r $Filename Most.BusinessCore.System1CIntegration
copy $Filename c:\AutoDeploy\ftp_root

Remove-Item -force c:\AutoDeploy\ftp_root\WcfElma.Last.$Release

cmd.exe /c mklink c:\AutoDeploy\ftp_root\WcfElma.Last.$Release c:\AutoDeploy\ftp_root\$Filename
