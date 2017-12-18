param([String]$Filename,[String]$Release,[String]$Enviropment)

echo "Prepare and Archive Distributive for $Release enviropment to $Filename"

& "C:\Program Files\7-Zip\7z.exe" a -r $Filename CbookingWebsite
copy $Filename c:\AutoDeploy\ftp_root
Remove-Item -force c:\AutoDeploy\ftp_root\CBooking.Last.$Enviropment
cmd.exe /c mklink c:\AutoDeploy\ftp_root\CBooking.Last.$Enviropment c:\AutoDeploy\ftp_root\$Filename

