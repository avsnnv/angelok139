param([String]$Filename,[String]$Release,[String]$Enviropment,[String]$runCommand)

echo "Prepare and Archive Distributive for $Release enviropment to $Filename"
cd Expedia.Core.Node
npm install -f
npm run build:$runCommand
cd ..\Expedia.Core.Api
Remove-Item -force Web.config
Copy-Item Web.$Release.config Web.config
cd ..

Remove-Item -force Expedia.Core.Services\bin\$Release\Expredia.Core.WinServices.exe.config
Copy-Item Expedia.Core.Services\App.$Release.config Expedia.Core.Services\bin\$Release\Expredia.Core.WinServices.exe.config

Remove-Item -force Expedia.Core.Services\bin\$Release\NLog.config
Copy-Item Expedia.Core.Services\NLog.$Release.config Expedia.Core.Services\bin\$Release\NLog.config

& "C:\Program Files\7-Zip\7z.exe" a -r $Filename Expedia.Core.Services
& "C:\Program Files\7-Zip\7z.exe" a -r $Filename Expedia.Core.Api
& "C:\Program Files\7-Zip\7z.exe" a -r $Filename Expedia.Core.Node
copy $Filename c:\AutoDeploy\ftp_root
Remove-Item -force c:\AutoDeploy\ftp_root\Expedia.Last.$Enviropment
cmd.exe /c mklink c:\AutoDeploy\ftp_root\Expedia.Last.$Enviropment c:\AutoDeploy\ftp_root\$Filename

