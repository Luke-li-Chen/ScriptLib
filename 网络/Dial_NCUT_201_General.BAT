:start
@echo off
echo 1.连接pppoe
echo 2.关闭pppoe
echo 3.重拨PPPOE
echo q.退出脚本

set /p str= (输入数字)
if /i "%str%" == "%str%" goto %str%

:3
rasdial "宽带连接" /disconnect
rasdial "宽带连接" username@wo201 password
netsh interface ipv4 show address "宽带连接"
pause
cls
goto start
:2
rasdial "宽带连接" /disconnect
pause
cls
goto start
:1
rasdial "宽带连接" username@wo201 password
netsh interface ipv4 show address "宽带连接"
pause
cls
goto start
:q
exit
