param([String]$Release,[String]$path_api)

cd c:\temp
git clone https://github.com/angelok139/angelok139
cd angelok139
javac DevOps\src\devops\*
java -cp .\DevOps\src devops.Patch --inputfile=..\Most.Core\Most.Core.API\Web.$Release.config --outputfile=..\Most.Core\Most.Core.API\Web.config --patchfile=.\Patches\testserver.patch

cd c:\temp\Most.Core\
robocopy Most.Core.API $path_api /E
