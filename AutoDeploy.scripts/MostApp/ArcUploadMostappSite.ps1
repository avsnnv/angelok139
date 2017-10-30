param([String]$Filename,[String]$Release)

echo "Prepare and Archive Distributive for $Release enviropment to $Filename"

Remove-Item -force Most.Core\Most.Core.API.Services\bin\$Release\Most.Core.API.Services.exe.config
Copy-Item Most.Core\Most.Core.API.Services\App.$Release.config Most.Core\Most.Core.API.Services\bin\$Release\Most.Core.API.Services.exe.config

Remove-Item -force Most.Core\Most.Core.API.Services\bin\$Release\NLog.config
Copy-Item Most.Core\Most.Core.API.Services\NLog.$Release.config Most.Core\Most.Core.API.Services\bin\$Release\NLog.config

#javac DevOps\src\devops\*
#java -cp .\DevOps\src devops.Patch --inputfile=.\Most.Core\Most.Core.API\Web.Debug.config --outputfile=.\Most.Core\Most.Core.API\Web.config --patchfile=.\Patches\testserver.patch 

& "C:\Program Files\7-Zip\7z.exe" a -r $Filename Most.Core\Most.Core.API
& "C:\Program Files\7-Zip\7z.exe" a -r $Filename Most.Core\Most.Core.API.Services
& "C:\Program Files\7-Zip\7z.exe" a -r $Filename Most.Core\Most.Core.Statistics.Web
& "C:\Program Files\7-Zip\7z.exe" a -r $Filename Most.Core\Most.Core.OrangeDataService
copy $Filename c:\AutoDeploy\ftp_root
echo $filename >CoreApi.Last.$Release
