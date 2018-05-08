# escape=`

FROM microsoft/aspnet

RUN iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')) ;choco install -y --no-progress nodejs-lts git; wget -usebasicparsing ftp://$ftpUser:$ftpPassword@testserver1.mostapp.com/Expedia.Api.Last.Debug -outfile c:\Expedia.API.zip; expand-archive -Path c:\\Expedia.API.zip -destinationPath c:\ -force; New-IISSite -Name "Site" -PhysicalPath C:\Expedia.Core.Api -BindingInformation "*:8000:"
RUN wget -usebasicparsing ftp://$ftpUser:$ftpPassword@testserver1.mostapp.com/Expedia.Node.Last.Debug -outfile c:\Expedia.GUI.zip; expand-archive -Path c:\\Expedia.GUI.zip -destinationPath c:\ -force; npm install -f; run build:$runCommand; npm -g install pm2
EXPOSE 4000 8000

