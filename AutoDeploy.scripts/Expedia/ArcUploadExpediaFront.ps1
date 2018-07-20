param([String]$Filename,[String]$Release,[String]$Enviropment,[String]$runCommand)
echo "Prepare and Archive Distributive for $Release enviropment to $Filename"
cd Expedia.Core.Node
npm install 
npm run build:$runCommand
Remove-Item -Force -Recurse c:\temp\bundle
mkdir c:\temp\bundle
Move-Item node_modules C:\temp\bundle
npm i --production
cd ..
& "C:\Program Files\7-Zip\7z.exe" a -r $Filename Expedia.Core.Node
Remove-Item -Force -Recurse .\Expedia.Core.Node\node_modules
move-item C:\temp\bundle\node_modules Expedia.Core.Node
Move-Item $Filename c:\AutoDeploy\ftp_root
Remove-Item -force c:\AutoDeploy\ftp_root\Expedia.Front.Last.$Enviropment
cmd.exe /c mklink c:\AutoDeploy\ftp_root\Expedia.Front.Last.$Enviropment c:\AutoDeploy\ftp_root\$Filename
