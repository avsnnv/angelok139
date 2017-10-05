param([String]$server,[String]$Release,[String]$path_stats)
echo "Install API on $server release $Release to $path_stats"

Invoke-Command -ComputerName $server -ScriptBlock {
param([String]$Release,[String]$path_stats)

cd c:\temp\Most.Core\Most.Core.Statistics.Web

#$path_stats="C:\AutoDeploy\Stats"



Remove-Item -Recurse $path_stats\App_Data
Move-Item App_Data $path_stats\

Remove-Item -Recurse $path_stats\Areas
Move-Item Areas $path_stats\

Remove-Item -Recurse $path_stats\bin
Move-Item bin $path_stats\

Remove-Item -Recurse $path_stats\Content
Move-Item Content $path_stats\

Remove-Item -Recurse $path_stats\fonts
Move-Item fonts $path_stats\

Remove-Item -Recurse $path_stats\Scripts
Move-Item Scripts $path_stats\

Remove-Item -Recurse $path_stats\Views
Move-Item Views $path_stats\

Remove-Item  $path_stats\ApplicationInsights.config
Move-Item ApplicationInsights.config $path_stats\

Remove-Item  $path_stats\favicon.ico
Move-Item favicon.ico $path_stats\

Remove-Item  $path_stats\Global.asax
Move-Item Global.asax $path_stats\

Remove-Item  $path_stats\packages.config
Move-Item packages.config $path_stats\

Remove-Item  $path_stats\Web.config
Move-Item Web.$Release.config $path_stats\
Rename-Item $path_stats\Web.$Release.config $path_stats\Web.config
} -ArgumentList $Release,$path_stats