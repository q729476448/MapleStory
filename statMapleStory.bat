@echo off
for /f "delims=" %%i in ('wmic process where caption^="MapleStory.exe" get commandline /value ^| find "Map"') do set info=%%i 
for /f "tokens=4,5* delims= " %%j in ("%info%") do set a=%%k & set pas=%%l
taskkill /f /im MapleStory.exe
set lePath=G:\game\LocaleEmulator\LEProc.exe
set gamePath=G:\game\Gamania\MapleStory\MapleStory.exe
set fixedParam=tw.login.maplestory.gamania.com 8484 BeanFun
powershell -command "&{ Start-Process %lePath% -ArgumentList '-run %gamePath% %fixedParam% %a% %pas%'}"