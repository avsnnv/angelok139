param([String]$server)
echo "Begin stopping Services on $server"

Invoke-Command -ComputerName $server -ScriptBlock  {
Get-Service -Name Core* | Stop-Service 
}