param([String]$Release,[String]$path_Sirena)

cd c:\temp
robocopy SirenaTravelProxyGateWcf\bin\$Release $path_Sirena\bin 

Copy-Item SirenaTravelProxyGateWcf\Web.config $path_Sirena

