param([String]$Filename,[String]$Release,[String]$Enviropment)

echo "Prepare and Archive Distributive for $Release enviropment to $Filename"

cd CBooking.MetaHotelHub
Remove-Item -force Web.config
Copy-Item Web.$Release.config Web.config
cd ..


& "C:\Program Files\7-Zip\7z.exe" a -r $Filename CBooking.MetaHotelHub

Move-Item $Filename c:\AutoDeploy\ftp_root
Remove-Item -force c:\AutoDeploy\ftp_root\OrdersSalvatory.Last.$Enviropment
cmd.exe /c mklink c:\AutoDeploy\ftp_root\OrdersSalvatory.Last.$Enviropment c:\AutoDeploy\ftp_root\$Filename

