param([String]$Filename,[String]$Release,[String]$Enviropment)

echo "Prepare and Archive Distributive for $Release enviropment to $Filename"

Remove-Item -force Most.Core.IntegrationCore\Most.Core.Meta.API
Copy-Item Most.Core.IntegrationCore\Most.Core.Meta.API\Web.$Release.config Most.Core.IntegrationCore\Most.Core.Meta.API\.config

& "C:\Program Files\7-Zip\7z.exe" a -r $Filename Most.Core.IntegrationCore\Most.Core.Meta.API
copy $Filename c:\AutoDeploy\ftp_root
Remove-Item -force c:\AutoDeploy\ftp_root\Most.Core.Meta.Api.$Enviropment
cmd.exe /c mklink c:\AutoDeploy\ftp_root\Most.Core.Meta.Api.$Enviropment c:\AutoDeploy\ftp_root\$Filename

