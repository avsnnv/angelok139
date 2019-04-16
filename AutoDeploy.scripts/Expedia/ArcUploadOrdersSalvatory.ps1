param([String]$Filename,[String]$Release,[String]$Enviropment)

echo "Prepare and Archive Distributive for $Release enviropment to $Filename"

cd OrdersSalvatory.Core.OutputOrdersWCF
Remove-Item -force Web.config
Copy-Item Web.$Release.config Web.config
cd ..


echo "Prepare service config"
Remove-Item -force OrdersSalvatory.Core.GatherExpediaOrder\bin\$Release\OrdersSalvatory.Core.GatherExpediaOrder.exe.config
Copy-Item OrdersSalvatory.Core.GatherExpediaOrder\App.$Release.config OrdersSalvatory.Core.GatherExpediaOrder\bin\$Release\OrdersSalvatory.Core.GatherExpediaOrder.exe.config

Remove-Item -force OrdersSalvatory.Core.BuhOrderCollector\bin\$Release\OrdersSalvatory.Core.BuhOrderCollector.exe.config
Copy-Item OrdersSalvatory.Core.BuhOrderCollector\App.$Release.config OrdersSalvatory.Core.BuhOrderCollector\bin\$Release\OrdersSalvatory.Core.BuhOrderCollector.exe.config

& "C:\Program Files\7-Zip\7z.exe" a -r $Filename OrdersSalvatory.Core.OutputOrdersWCF
& "C:\Program Files\7-Zip\7z.exe" a -r $Filename OrdersSalvatory.Core.GatherExpediaOrder
& "C:\Program Files\7-Zip\7z.exe" a -r $Filename OrdersSalvatory.Core.BuhOrderCollector

Move-Item $Filename c:\AutoDeploy\ftp_root
Remove-Item -force c:\AutoDeploy\ftp_root\OrdersSalvatory.Last.$Enviropment
cmd.exe /c mklink c:\AutoDeploy\ftp_root\OrdersSalvatory.Last.$Enviropment c:\AutoDeploy\ftp_root\$Filename

