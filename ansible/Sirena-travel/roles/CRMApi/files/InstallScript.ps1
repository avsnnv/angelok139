ncftpget -u teamcity -p Qq111111 10.1.8.155 c:\temp\ CRM.API.Last.7z 
 
& "C:\Program Files\7-Zip\7z" x c:\temp\CRM.API.Last.7z -oc:\temp -y

Stop-Service Crm.BLL.Services
Stop-Service Crm.Csv.Service
Stop-Service Crm.Sender.Service
Stop-Service Crm.SelfHost.Service
Start-Sleep -s 10

Remove-Item -Recurse c:\projects\Crm.BLL.Services
mkdir c:\projects\Crm.BLL.Services
Copy-Item C:\temp\Build\Crm.BLL.Services\Release\*.* c:\projects\Crm.BLL.Services\ 
$service=Get-Service Crm.BLL.Services | Measure-Object
if ($service.Count -eq 0){
    c:\projects\Crm.BLL.Services\Crm.BLL.Services -install name Crm.BLL.Services
}
else
{
echo "Service installed"
}

Start-Service Crm.BLL.Services



Remove-Item -Recurse c:\projects\Crm.Csv.Service
mkdir c:\projects\Crm.Csv.Service
Copy-Item C:\temp\Build\Crm.Csv.Service\Release\*.* c:\projects\Crm.Csv.Service\ -Force
$service=Get-Service Crm.Csv.Service | Measure-Object
if ($service.Count -eq 0){
    c:\projects\Crm.Csv.Service\Crm.Csv.Service -install name Crm.Csv.Service
}
else
{
echo Service installed
}
Start-Service Crm.Csv.Service





Remove-Item -Recurse c:\projects\Crm.Sender.Service
mkdir c:\projects\Crm.Sender.Service
Copy-Item C:\temp\Build\Crm.Sender.Service\Release\*.* c:\projects\Crm.Sender.Service\ -Force
$service=Get-Service Crm.Sender.Service | Measure-Object
if ($service.Count -eq 0){
    c:\projects\Crm.Sender.Service\Crm.Sender.Service -install name Crm.Sender.Service
}
else
{
echo Service installed
}

Start-Service Crm.Sender.Service

Remove-Item -Recurse c:\projects\Crm.SelfHost

mkdir c:\projects\Crm.SelfHost
Copy-Item C:\temp\Build\Crm.SelfHost\Release\*.* c:\projects\Crm.SelfHost\ -Force
$service=Get-Service Crm.SelfHost.Service | Measure-Object
if ($service.Count -eq 0){
    c:\projects\Crm.SelfHost\Crm.SelfHost -install name Crm.SelfHost.Service
}
else
{
echo Service installed
}
Start-Service Crm.SelfHost.Service

