param([String]$Filename,[String]$Release,[String]$Enviropment)

echo "Prepare and Archive Distributive for $Release enviropment to $Filename"

Remove-Item -force Most.Core.IntegrationCore\Most.Core.Meta.API\Web.config
Copy-Item Most.Core.IntegrationCore\Most.Core.Meta.API\Web.$Release.config Most.Core.IntegrationCore\Most.Core.Meta.API\Web.config

Remove-Item -force Most.Core.IntegrationCore\Most.Core.Meta.WCF\Web.config
Copy-Item Most.Core.IntegrationCore\Most.Core.Meta.WCF\Web.$Release.config Most.Core.IntegrationCore\Most.Core.Meta.WCF\Web.config


& "C:\Program Files\7-Zip\7z.exe" a -r $Filename Most.Core.IntegrationCore\Most.Core.Meta.API
& "C:\Program Files\7-Zip\7z.exe" a -r $Filename Most.Core.IntegrationCore\Most.Core.Meta.WCF
copy $Filename c:\AutoDeploy\ftp_root
Remove-Item -force c:\AutoDeploy\ftp_root\Most.Core.Meta.Api.$Enviropment
cmd.exe /c mklink c:\AutoDeploy\ftp_root\Most.Core.Meta.Api.$Enviropment c:\AutoDeploy\ftp_root\$Filename

