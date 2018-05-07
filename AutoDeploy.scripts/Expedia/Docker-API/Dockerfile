FROM microsoft/iis
RUN powershell wget -usebasicparsing ftp://$ftpUser:$ftpPassword@testserver1.mostapp.com/Expedia.Api.Last.Debug -outfile c:\Expedia.API.zip
RUN powershell expand-archive -Path c:\\Expedia.API.zip -destinationPath c:\inetpub\wwwroot -force 

