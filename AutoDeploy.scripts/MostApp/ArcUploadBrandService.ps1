param($Filename,[String]$Release)

echo "Prepare and Archive Distributive BrandService for $Release enviropment to $Filename"

Remove-Item -force BrandService\Web.config
Copy-Item BrandService\Web.$Release.config BrandService\Web.config

& "C:\Program Files\7-Zip\7z.exe" a -r $Filename BrandService
copy $Filename c:\AutoDeploy\ftp_root

cmd.exe /c mklink c:\AutoDeploy\ftp_root\BrandService.Last.$Release c:\AutoDeploy\ftp_root\$Filename
