mkdir c:\AutoDeploy
mkdir c:\temp
mkdir c:\db
ncftpget -u most_app -p IonLVBee ftpstore2.radiushost.ru c:\db /haserver.config/mongos.cfg
mkdir c:\db\config
mkdir c:\db\db-rs01
mkdir c:\db\db-rs02
mkdir c:\db\logs
New-NetFirewallRule -DisplayName MongoDB -Action Allow -Protocol TCP -LocalPort 27017-27022 -RemoteAddress 37.143.13.249,95.213.177.66 
New-NetFirewallRule -DisplayName ping -Action Allow -Protocol ICMPv4 -RemoteAddress 37.143.14.146
& 'C:\Program Files\MongoDB\Server\3.4\bin\mongod.exe' --dbpath c:\db\db-rs01 --logpath c:\db\logs\mongo-rs01.log --logappend --replSet rs01 --install --serviceName MongoDB_rs01 --serviceDisplayName "MongoDB rs01" --port 27021 --shardsvr
& 'C:\Program Files\MongoDB\Server\3.4\bin\mongod.exe' --dbpath c:\db\db-rs02 --logpath c:\db\logs\mongo-rs02.log --logappend --replSet rs02 --install --serviceName MongoDB_rs02 --serviceDisplayName "MongoDB rs02" --port 27020 --shardsvr
& 'C:\Program Files\MongoDB\Server\3.4\bin\mongod.exe' --configsvr --dbpath c:\db\config --logpath c:\db\logs\mongo-cfg.log --logappend --replSet rscfg --port 27019 --install --serviceName MongoCFG --serviceDisplayName "Mongo Config"
Start-Service MongoDB_rs01
Start-Service MongoDB_rs02
Start-Service MongoCFG
& 'C:\Program Files\MongoDB\Server\3.4\bin\mongos.exe' --install --config C:\db\mongos.cfg
Start-Service MongoS
winrm quickconfig -q
New-NetFirewallRule -DisplayName Site -Action Allow -Protocol TCP -LocalPort 5010,5020,5030,5040
Install-WindowsFeature Web-Server
Install-WindowsFeature Web-Http-Redirect, Web-Custom-Logging, Web-Log-Libraries, Web-Request-Monitor, Web-Http-Tracing, Web-Dyn-Compression, Web-IP-Security, Web-Url-Auth, Web-CertProvider, Web-Basic-Auth
Install-WindowsFeature Web-ASP, Web-Asp-Net, Web-Asp-Net45, Web-ISAPI-Ext, Web-Net-Ext, Web-Net-Ext45, Web-ISAPI-Filter 
Install-WindowsFeature Web-Mgmt-Console, Web-Mgmt-Service, Server-Media-Foundation, NET-WCF-HTTP-Activation45, NET-WCF-TCP-Activation45
Remove-WindowsFeature FS-SMB1
Enable-PSRemoting
Set-Item WSMan:\localhost\Client\TrustedHosts "188.65.211.36" -Force
New-NetFirewallRule -DisplayName TeamCity -Action Allow -protocol TCP -LocalPort 5985 -remoteaddress 188.65.211.36

New-WebAppPool -name CoreAPI
New-IISSite -Name CoreAPI -PhysicalPath "C:\inetpub\wwwroot\Core" -BindingInformation "*:5010:"
Get-IISSite -name CoreAPI
New-NetFirewallRule -DisplayName Zabbix -Action Allow -protocol TCP -LocalPort 10050 -RemoteAddress 37.143.14.146