param([String[]]$server)
echo "Begin stopping IIS on $server"

Invoke-Command -ComputerName $server -ScriptBlock  {
Stop-Service W3SVC
}