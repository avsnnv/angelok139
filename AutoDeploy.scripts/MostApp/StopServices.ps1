Invoke-Command -ComputerName %env.servers% -ScriptBlock {
echo Begin stopping Services on %env.servers%
Get-Service -Name Core* | Stop-Service 
}
