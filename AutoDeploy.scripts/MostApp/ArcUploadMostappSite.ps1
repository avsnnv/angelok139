param([String]$Filename,[String]$Release)

echo Prepare and Archive Distributive release for $Release enviropment to $Filename

Remove-Item -force Most.Core\Most.Core.API.Services\bin\$Release\Most.Core.API.Services.exe.config
Copy-Item Most.Core\Most.Core.API.Services\App.$Release.config Most.Core\Most.Core.API.Services\bin\$Release\Most.Core.API.Services.exe.config

Remove-Item -force Most.Core\Most.Core.API.Services\bin\$Release\NLog.config
Copy-Item Most.Core\Most.Core.API.Services\NLog.$Release.config Most.Core\Most.Core.API.Services\bin\$Release\NLog.config

& "C:\Program Files\7-Zip\7z.exe" a -r $Filename Most.Core\Most.Core.API
& "C:\Program Files\7-Zip\7z.exe" a -r $Filename Most.Core\Most.Core.API.Services
& "C:\Program Files\7-Zip\7z.exe" a -r $Filename Most.Core\Most.Core.Statistics.Web
copy $Filename c:\AutoDeploy\ftp_root