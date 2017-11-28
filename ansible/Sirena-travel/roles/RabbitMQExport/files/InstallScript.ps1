mkdir c:\temp
ncftpget -u teamcity -p Qq111111 192.168.0.1 c:\temp\ RMQWorkerExportUT.Last
& "C:\Program Files\7-Zip\7z" x c:\temp\RMQWorkerExportUT.Last.7z -oc:\temp -y

mkdir c:\projects\RMQWorkerExportUT\
Copy-Item C:\temp\Build\RMQWorkerExportUT\Release\*.* c:\projects\RMQWorkerExportUT\ -Force
c:\projects\RMQWorkerExportUT\RMQWorkerExportUT -install name RMQWorkerExportUT
Start-Service RMQWorkerExportUT

