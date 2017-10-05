param([String]$server,[String]$Release,[String]$path_api)
echo "Install API on $server release $Release to $path_api"

Invoke-Command -ComputerName $server -ScriptBlock {
param([String]$Release,[String]$path_api)


#echo $Release
#echo $path_api
cd c:\temp
git clone https://github.com/angelok139/angelok139
cd angelok139
javac DevOps\src\devops\*
java -cp .\DevOps\src devops.Patch --inputfile=..\Most.Core\Most.Core.API\Web.$Release.config --outputfile=..\Most.Core\Most.Core.API\Web.config --patchfile=.\Patches\testserver.patch 

cd c:\temp\Most.Core\Most.Core.API
#$path_api="c:\AutoDeploy\API"

remove-Item -Recurse $path_api\App
Move-Item App $path_api\

Remove-Item -Recurse $path_api\App_Data
Move-Item App_Data $path_api\

Remove-Item -Recurse $path_api\Areas
Move-Item Areas $path_api\

Remove-Item -Recurse $path_api\assets
Move-Item assets $path_api\

Remove-Item -Recurse $path_api\bin
Move-Item bin $path_api\

Remove-Item -Recurse $path_api\Content
Move-Item Content $path_api\

Remove-Item -Recurse $path_api\fonts
Move-Item fonts $path_api\

Remove-Item -Recurse $path_api\Images
Move-Item Images $path_api\

Remove-Item -Recurse $path_api\References
Move-Item References $path_api\

Remove-Item -Recurse $path_api\Scripts
Move-Item Scripts $path_api\

Remove-Item -Recurse $path_api\Views
Move-Item Views $path_api\

Remove-Item  $path_api\ApplicationInsights.config
Move-Item ApplicationInsights.config $path_api\

Remove-Item  $path_api\favicon.ico
Move-Item favicon.ico $path_api\

Remove-Item  $path_api\Global.asax
Move-Item Global.asax $path_api\

Remove-Item  $path_api\packages.config
Move-Item packages.config $path_api\

Remove-Item  $path_api\Web.config
Move-Item Web.config $path_api\


#Remove-Item  $path_api\Web.config

#Move-Item Web.$Release.config $path_api\
#Rename-Item $path_api\Web.$Release.config $path_api\Web.config
} -ArgumentList $Release,$path_api