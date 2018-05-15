# escape=`

FROM angelok139/expedia:basic
RUN wget -usebasicparsing ftp://$ftpUser:$ftpPassword@testserver1.mostapp.com/Expedia.Api.Last.Debug -outfile c:\Expedia.API.zip; expand-archive -Path c:\\Expedia.API.zip -destinationPath c:\ -force; New-IISSite -Name "Site" -PhysicalPath C:\Expedia.Core.Api -BindingInformation "*:8000:"; wget -usebasicparsing ftp://$ftpUser:$ftpPassword@testserver1.mostapp.com/Expedia.Node.Last.Debug -outfile c:\Expedia.GUI.zip; expand-archive -Path c:\\Expedia.GUI.zip -destinationPath c:\ -force;cd Expedia.Core.Node;npm install -f
COPY start.ps1 c:/
ENTRYPOINT c:/start.ps1

