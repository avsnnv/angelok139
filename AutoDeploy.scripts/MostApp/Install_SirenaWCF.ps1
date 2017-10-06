param([String]$server,[String]$Release,[String]$path_Sirena)
echo "Install API on $server release $Release to $path_Sirena"

Invoke-Command -ComputerName $server -ScriptBlock {
param([String]$Release,[String]$path_Sirena)

cd c:\temp
robocopy SirenaTravelProxyGateWcf\bin\$Release $path_Sirena\bin 

#git clone https://github.com/angelok139/angelok139
#javac angelok139\DevOps\src\devops\*
#java -cp .\angelok139\DevOps\src devops.Patch --inputfile=\Web.$Release.config --outputfile=..\Most.Core\Most.Core.API\Web.config --patchfile=.\Patches\testserver.sirena.patch 


Copy-Item SirenaTravelProxyGateWcf\Web.config C:\inetpub\wwwroot\services\sirena_wcf


#echo $Release
#echo $path_api



} -ArgumentList $Release,$path_Sirena