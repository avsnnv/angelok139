mkdir c:\temp

ncftpget -u teamcity -p Qq111111 192.168.0.1 c:\temp\ CRM.Auth.Last.7z 
 
& "C:\Program Files\7-Zip\7z" x c:\temp\CRM.Auth.Last.7z -oc:\temp -y
mkdir c:\projects
icacls c:\projects /grant:r --% "avih":(OI)(CI)M

mkdir c:\projects\Crm.Auth.Service\
Copy-Item C:\temp\Build\Crm.Auth.Service\Release\*.* c:\projects\Crm.Auth.Service\ -Force
c:\projects\Crm.Auth.Service\Crm.Auth.Service -install name Crm.Auth.Service
Start-Service Crm.Auth.Service

mkdir c:\projects\Crm.Auth.WebAPI\
Copy-Item C:\temp\Build\Crm.Auth.WebApi\Release\*.* c:\projects\Crm.Auth.WebApi\ -Force
    c:\projects\Crm.Auth.WebApi\Crm.Auth.WebApi -install name Crm.Auth.WebApi
