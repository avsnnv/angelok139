mkdir c:\temp
ncftpget -u teamcity -p Qq111111 192.168.0.1 c:\temp\ LeoLoader.Last.7z
& "C:\Program Files\7-Zip\7z" x c:\temp\LeoLoader.Last.7z -oc:\temp -y

mkdir c:\projects\Leo.Test.Producer
Copy-Item C:\temp\Build\Leo.Test.Producer\Release\*.* c:\projects\Leo.Test.Producer\
