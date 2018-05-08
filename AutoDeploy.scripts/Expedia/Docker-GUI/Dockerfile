FROM stefanscherer/node-windows:8.11.1-build-tools
RUN powershell wget -usebasicparsing ftp://$ftpUser:$ftpPassword@testserver1.mostapp.com/Expedia.Node.Last.Debug -outfile c:\Expedia.GUI.zip
RUN powershell expand-archive -Path c:\\Expedia.GUI.zip -destinationPath c:\ -force
WORKDIR c:\Expedia.Core.Node
RUN powershell npm install -f
RUN powershell npm run build:$runCommand
RUN powershell npm -g install pm2
EXPOSE 4000
ENTRYPOINT powershell -noexit npm run start:pm2

