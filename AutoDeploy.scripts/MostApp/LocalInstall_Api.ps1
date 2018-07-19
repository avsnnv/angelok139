param([String]$Release,[String]$path_api)

cd c:\temp\Most.Core\
$hostname = (hostname| Out-String).Replace("`r`n","")
(Get-Content Most.Core.API\Web.$Release.config -Encoding UTF8).replace('$HostName',$hostname)|Set-Content Most.Core.API\Web.config -Encoding UTF8
robocopy Most.Core.API $path_api /E
