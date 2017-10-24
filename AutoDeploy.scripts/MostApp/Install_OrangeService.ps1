param([String]$server,[String]$Release,[String]$path_Orange)
echo "Install API on $server release $Release to $path_Orange"

Invoke-Command -ComputerName $server -ScriptBlock {
param([String]$Release,[String]$path_Orange)

cd c:\temp\Most.Core\Most.Core.OrangeDataService

robocopy bin $path_Orange

Copy-Item Web.$Release.config $path_Sirena\Web.config

} -ArgumentList $Release,$path_Orange
