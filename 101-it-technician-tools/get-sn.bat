echo %time:~0,2%%time:~3,2%%time:~6,2%(time)_%date:~-10,2%%date:~-7,2%%date:~-4,4%(date) >> "%CD%\log\%computername%.log"
echo %computername% >> "%CD%\log\%computername%.log"
wmic /append:"%CD%\log\%computername%.log" bios get serialnumber
wmic /append:"%CD%\log\%computername%.log" ComputerSystem get TotalPhysicalMemory
wmic /append:"%CD%\log\%computername%.log" diskdrive get name,size,caption,serialnumber
"%CD%/smartmontools/bin/smartctl.exe" --scan >> "%CD%\log\%computername%.log"
echo ----------------------------------------------------------------------------------------- >> "%CD%\log\%computername%.log"
"%CD%/smartmontools/bin/smartctl.exe" -i /dev/sda | find "Model" >> "%CD%\log\%computername%.log"
"%CD%/smartmontools/bin/smartctl.exe" -i /dev/sda | find "Serial" >> "%CD%\log\%computername%.log"
"%CD%/smartmontools/bin/smartctl.exe" -i /dev/sda | find "Capacity" >> "%CD%\log\%computername%.log"
"%CD%/smartmontools/bin/smartctl.exe" -H /dev/sda | find "result" >> "%CD%\log\%computername%.log" 
echo ***************************************************************************************** >> "%CD%\log\%computername%.log"
Rem "%CD%\log\%computername%.log"