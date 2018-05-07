FROM microsoft/iis

RUN powershell wget -usebasicparsing ftp://$ftpUser:$ftpPassword@testserver1.mostapp.com/Expedia.Api.Last.Debug -outfile c:\temp\Expedia.API.zip
RUN powershell expand-archive -Path c:\temp\Expedia.API.zip -destinationPath c:\
