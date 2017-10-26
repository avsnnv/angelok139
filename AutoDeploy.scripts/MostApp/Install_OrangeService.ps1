param([String]$server,[String]$Release,[String]$path_Orange)
echo "Install API on $server release $Release to $path_Orange"

Invoke-Command -ComputerName $server -ScriptBlock {
param([String]$Release,[String]$path_Orange)

cd c:\temp\Most.Core\Most.Core.OrangeDataService

robocopy bin $path_Orange\bin
robocopy OrangeData $path_Orange\OrangeData
robocopy OrangeService $path_Orange\OrangeService

Copy-Item Web.$Release.config $path_Orange\Web.config

robocopy Keys.$Release C:\OrangeCert
& "C:\Program Files\7-Zip\7z" x C:\OrangeCert\client.rar -oc:\OrangeCert\ -y

} -ArgumentList $Release,$path_Orange
