param([String]$Filename,[String]$Release)

echo "Prepare and Archive Distributive BrandService for $Release enviropment to $Filename"

Remove-Item -force BrandService\Web.config
Copy-Item BrandService\Web.Debug.config BrandService\Web.config

& "C:\Program Files\7-Zip\7z.exe" a -r $FileName BrandService
copy $FileName c:\AutoDeploy\ftp_root

cmd.exe /c mklink c:\AutoDeploy\ftp_root\BrandService.Last.$Enviropment c:\AutoDeploy\ftp_root\$Filename
