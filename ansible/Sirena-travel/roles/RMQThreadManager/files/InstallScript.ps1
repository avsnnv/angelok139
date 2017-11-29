mkdir c:\temp
ncftpget -u teamcity -p Qq111111 192.168.0.1 c:\temp\ RMQThreadManager.Last.7z
& "C:\Program Files\7-Zip\7z" x c:\temp\RMQThreadManager.Last.7z -oc:\temp -y

mkdir c:\projects\RMQThreadManager\
Copy-Item C:\temp\Build\RMQThreadManager\Release\*.* c:\projects\RMQThreadManager\ 
c:\projects\RMQThreadManager\RMQThreadManager -install name RMQThreadManager

