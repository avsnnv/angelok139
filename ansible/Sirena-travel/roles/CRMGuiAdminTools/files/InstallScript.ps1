mkdir c:\temp
ncftpget -u teamcity -p Qq111111 192.168.0.1 c:\temp\ CRM.GUI.AdminTools.{{ GuAd_build }}.7z  
mkdir c:\projects
icacls c:\projects /grant:r --% "avih":(OI)(CI)M

& "C:\Program Files\7-Zip\7z" x c:\temp\CRM.GUI.AdminTools.{{ GuAd_build }}.7z -oC:\temp -y
new-item c:\projects\Crm.Gui.Dev\admin -type Directory
Copy-Item c:\temp\Build\* c:\projects\Crm.Gui.Dev\admin -Recurse
new-item c:\projects\Crm.Gui.Dev\sadmin -type Directory
Copy-Item c:\temp\Build\* c:\projects\Crm.Gui.Dev\sadmin -Recurse

