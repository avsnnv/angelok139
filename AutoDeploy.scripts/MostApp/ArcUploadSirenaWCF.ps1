param([String]$Filename,[String]$Release)

echo "Prepare and Archive Distributive SirenaWCF for $Release enviropment to $Filename"

Remove-Item -force SirenaTravelProxyGateWcf\Web.config
Copy-Item SirenaTravelProxyGateWcf\App.$Release.config SirenaTravelProxyGateWcf\Web.config

& "C:\Program Files\7-Zip\7z.exe" a -r $Filename SirenaTravelProxyGateWcf
copy $Filename c:\AutoDeploy\ftp_root