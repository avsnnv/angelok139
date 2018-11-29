param([String]$Release)

Stop-Service OrdersSalvatory.BuhOrderCollector
Stop-Service OrdersSalvatory_Gatherer

C:\Windows\Microsoft.NET\Framework64\v4.0.30319\installUtil.exe /u c:\SalvatoryServices\OrdersSalvatory.Core.BuhOrderCollector\OrdersSalvatory.Core.BuhOrderCollector.exe
C:\Windows\Microsoft.NET\Framework64\v4.0.30319\installUtil.exe /u c:\SalvatoryServices\OrdersSalvatory.Core.GatherExpediaOrder\OrdersSalvatory.Core.GatherExpediaOrder.exe
Remove-Item -force -recurse c:\SalvatoryServices
mkdir c:\SalvatoryServices
mkdir c:\SalvatoryServices\OrdersSalvatory.Core.BuhOrderCollector
mkdir c:\SalvatoryServices\OrdersSalvatory.Core.GatherExpediaOrder

cd c:\temp\OrdersSalvatory.Core.GatherExpediaOrder\bin\$Release
robocopy . c:\SalvatoryServices\OrdersSalvatory.Core.GatherExpediaOrder /e
cd c:\temp\OrdersSalvatory.Core.BuhOrderCollector\bin\$Release
robocopy . c:\SalvatoryServices\OrdersSalvatory.Core.BuhOrderCollector /e


C:\Windows\Microsoft.NET\Framework64\v4.0.30319\installUtil.exe c:\SalvatoryServices\OrdersSalvatory.Core.BuhOrderCollector\OrdersSalvatory.Core.BuhOrderCollector.exe
C:\Windows\Microsoft.NET\Framework64\v4.0.30319\installUtil.exe c:\SalvatoryServices\OrdersSalvatory.Core.GatherExpediaOrder\OrdersSalvatory.Core.GatherExpediaOrder.exe
Start-Service OrdersSalvatory.BuhOrderCollector
Start-Service OrdersSalvatory_Gatherer
