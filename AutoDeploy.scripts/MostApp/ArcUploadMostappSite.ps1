param([String]$Filename,[String]$Release,[String]$Enviropment)

echo "Prepare and Archive Distributive for $Release enviropment to $Filename"

Remove-Item -force Most.Core\Most.Core.API.Services\bin\$Release\Most.Core.API.Services.exe.config
Copy-Item Most.Core\Most.Core.API.Services\App.$Release.config Most.Core\Most.Core.API.Services\bin\$Release\Most.Core.API.Services.exe.config

Remove-Item -force Most.Core\Most.Core.API.Services\bin\$Release\NLog.config
Copy-Item Most.Core\Most.Core.API.Services\NLog.$Release.config Most.Core\Most.Core.API.Services\bin\$Release\NLog.config

Remove-Item -force Most.Core\Most.Core.API.WCF\Web.config
Move-Item Most.Core\Most.Core.API.WCF\Web.$Release.config Most.Core\Most.Core.API.WCF\Web.config

& "C:\Program Files\7-Zip\7z.exe" a -r $Filename Most.Core\Most.Core.API
& "C:\Program Files\7-Zip\7z.exe" a -r $Filename Most.Core\Most.Core.API.Services
& "C:\Program Files\7-Zip\7z.exe" a -r $Filename Most.Core\Most.Core.Statistics.Web
& "C:\Program Files\7-Zip\7z.exe" a -r $Filename Most.Core\Most.Core.OrangeDataService
& "C:\Program Files\7-Zip\7z.exe" a -r $Filename Most.Core\Most.Core.API.WCF
copy $Filename c:\AutoDeploy\ftp_root
Remove-Item -force c:\AutoDeploy\ftp_root\Most.Core.Last.$Enviropment
cmd.exe /c mklink c:\AutoDeploy\ftp_root\Most.Core.Last.$Enviropment c:\AutoDeploy\ftp_root\$Filename

