mkdir c:\temp

ncftpget -u teamcity -p Qq111111 192.168.0.1 c:\temp\ CRM.API.Last.7z 
 
& "C:\Program Files\7-Zip\7z" x c:\temp\CRM.API.Last.7z -oc:\temp -y
mkdir c:\projects
icacls c:\projects /grant:r --% "avih":(OI)(CI)M

mkdir c:\projects\Crm.BLL.Services
Copy-Item C:\temp\Build\Crm.BLL.Services\Release\*.* c:\projects\Crm.BLL.Services\ 
c:\projects\Crm.BLL.Services\Crm.BLL.Services -install name Crm.BLL.Services
Start-Service Crm.BLL.Services



mkdir c:\projects\Crm.Csv.Service
Copy-Item C:\temp\Build\Crm.Csv.Service\Release\*.* c:\projects\Crm.Csv.Service\ -Force
c:\projects\Crm.Csv.Service\Crm.Csv.Service -install name Crm.Csv.Service
Start-Service Crm.Csv.Service

mkdir c:\projects\Crm.Sender.Service
Copy-Item C:\temp\Build\Crm.Sender.Service\Release\*.* c:\projects\Crm.Sender.Service\ -Force
c:\projects\Crm.Sender.Service\Crm.Sender.Service -install name Crm.Sender.Service
Start-Service Crm.Sender.Service

mkdir c:\projects\Crm.SelfHost
Copy-Item C:\temp\Build\Crm.SelfHost\Release\*.* c:\projects\Crm.SelfHost\ -Force
c:\projects\Crm.SelfHost\Crm.SelfHost -install name Crm.SelfHost.Service
Start-Service Crm.SelfHost.Service

