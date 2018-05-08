# escape=`

FROM microsoft/aspnet

RUN iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
RUN choco install -y nodejs-lts git
FROM microsoft/aspnet
RUN powershell wget -usebasicparsing ftp://$ftpUser:$ftpPassword@testserver1.mostapp.com/Expedia.Api.Last.Debug -outfile c:\Expedia.API.zip
RUN powershell expand-archive -Path c:\\Expedia.API.zip -destinationPath c:\ -force
RUN powershell New-IISSite -Name "Site" -PhysicalPath C:\Expedia.Core.Api -BindingInformation "*:8000:"
EXPOSE 8000
RUN powershell wget -usebasicparsing ftp://$ftpUser:$ftpPassword@testserver1.mostapp.com/Expedia.GUI.Last.Debug -outfile c:\Expedia.GUI.zip
RUN powershell expand-archive -Path c:\\Expedia.GUI.zip -destinationPath c:\ -force
RUN powershell npm install -f
RUN powershell npm run build:$runCommand
RUN powershell npm -g install pm2
EXPOSE 4000

