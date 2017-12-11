param($Filename,[String]$Release)

echo "Prepare and Archive Distributive AnnotationService for $Release enviropment to $Filename"

Remove-Item -force SearchAnnotationsServiceWCF\Web.config
Copy-Item SearchAnnotationsServiceWCF\Web.$Release.config SearchAnnotationsServiceWCF\Web.config

& "C:\Program Files\7-Zip\7z.exe" a -r $Filename SearchAnnotationsServiceWCF
copy $Filename c:\AutoDeploy\ftp_root

Remove-Item -force c:\AutoDeploy\ftp_root\SearchAnnotationsServiceWCF.Last.$Release

cmd.exe /c mklink c:\AutoDeploy\ftp_root\SearchAnnotationsServiceWCF.Last.$Release c:\AutoDeploy\ftp_root\$Filename
