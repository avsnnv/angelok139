cd c:\Expedia.Core.Node
pm2 start ./processes.json --env docker.debug
c:\ServiceMonitor.exe w3svc

