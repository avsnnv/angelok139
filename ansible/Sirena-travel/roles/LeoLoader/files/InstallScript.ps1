mkdir c:\temp
ncftpget -u teamcity -p Qq111111 192.168.0.1 c:\temp\ LeoLoader.Last.7z
& "C:\Program Files\7-Zip\7z" x c:\temp\LeoLoader.Last.7z -oc:\temp -y

mkdir c:\projects\CRM.Leo.Loader
Copy-Item C:\temp\Build\Leo.Loader\*.* c:\projects\CRM.Leo.Loader\
c:\projects\CRM.Leo.Loader\Leo.Loader -install name CRM.Leo.Loader
Start-Service CRM.Leo.Loader
