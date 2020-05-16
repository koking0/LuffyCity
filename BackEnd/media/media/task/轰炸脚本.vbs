On Error Resume Next 
Dim wsh,ye 
set wsh=createobject("wscript.shell") 
for i=1 to 99
wscript.sleep 70 
wsh.AppActivate("无敌") 
wsh.sendKeys "^v" 
wsh.sendKeys i 
wsh.sendKeys "%s" 
next 
wscript.quit

