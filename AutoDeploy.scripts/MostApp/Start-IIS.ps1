param([String]$server)
echo "Begin starting IIS on $server"

Invoke-Command -ComputerName $server -ScriptBlock  {
Start-Service W3SVC
}