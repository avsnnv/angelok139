param([String]$Filename,[String]$Release,[String]$Enviropment)

echo "Prepare and Archive Distributive for $Release enviropment to $Filename"
cd Expedia.Core.Api
Remove-Item -force Web.config
Copy-Item Web.$Release.config Web.config
cd ..

cd Most.Core.OrangeDataService
Remove-Item -force Web.config
Copy-Item Web.$Release.config Web.config
cd ..

echo "Prepare service config"
Remove-Item -force Expedia.Core.WinServices\bin\$Release\Expedia.Core.WinServices.exe.config
Copy-Item Expedia.Core.WinServices\App.$Release.config Expedia.Core.WinServices\bin\$Release\Expedia.Core.WinServices.exe.config

Remove-Item -force Expedia.Core.WinServices\bin\$Release\NLog.config
Copy-Item Expedia.Core.WinServices\NLog.$Release.config Expedia.Core.WinServices\bin\$Release\NLog.config

& "C:\Program Files\7-Zip\7z.exe" a -r $Filename Expedia.Core.WinServices
& "C:\Program Files\7-Zip\7z.exe" a -r $Filename Expedia.Core.Api
& "C:\Program Files\7-Zip\7z.exe" a -r $Filename Most.Core.OrangeDataService
Move-Item $Filename c:\AutoDeploy\ftp_root
Remove-Item -force c:\AutoDeploy\ftp_root\Expedia.API.Last.$Enviropment
cmd.exe /c mklink c:\AutoDeploy\ftp_root\Expedia.API.Last.$Enviropment c:\AutoDeploy\ftp_root\$Filename

