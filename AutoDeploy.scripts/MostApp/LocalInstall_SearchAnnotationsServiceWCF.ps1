param([String]$Release,[String]$path_SearchAnnotationsServiceWCF)

cd c:\temp\SearchAnnotationsServiceWCF\bin
robocopy . $path_SearchAnnotationsServiceWCF\bin /e /XF "Web.config"
cd ..
Copy-Item Web.config $path_SearchAnnotationsServiceWCF -force
Copy-Item WCFService\SearchAnnotationsService.svc $path_SearchAnnotationsServiceWCF -force

