param([String]$Release,[String]$path_api)

cd c:\temp\Most.Core\
$hostname = (hostname| Out-String).Replace("`r`n","")
(Get-Content Most.Core.API\Web.$Release.config).replace('$HostName',$hostname)|Set-Content Most.Core.API\Web.config

Remove-Item $path_api -Recurse 
New-Item $path_api -ItemType Directory
robocopy Most.Core.API $path_api /E
