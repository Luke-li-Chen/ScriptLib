@echo off

rem **************************
rem Script: Set_IPv4.bat
rem Creation Date: 2014/7/26
rem Last Modified: 2014/7/27
rem Auther: Chen Li
rem Version: 1.0.2
rem Description: 设置IPv4地址
rem **************************

set InterfaceName="以太网"

echo 请选择模式
echo 0.    DHCP
echo 1.    192.168.1.X /24
echo 2.    10.4.12.X /25
::echo 9.    Manual
echo q.    Quit

set /p mod=

if "%mod%" equ "0" ( 
    echo "IP & GateWay: DHCP"
    netsh interface ipv4 set address name=%InterfaceName% source=dhcp
    ::netsh interface ipv4 show address
    pause
    ) 

if "%mod%" equ "1" ( 
    echo IP: 192.168.1.X /24    GateWay: 192.168.1.1
    set /p ip="请输入IP最后一位"
    ) 
if "%mod%" equ "1" ( 
    netsh interface ipv4 set address name=%InterfaceName% source=static address=192.168.1.%ip% mask=255.255.255.0 gateway=192.168.1.1 gwmetric=0
    )

if "%mod%" equ "2" ( 
    echo IP: 10.4.12.X /25    GateWay: 10.4.12.1
    set /p ip="请输入IP最后一位"
    ) 
if "%mod%" equ "2" ( 
    netsh interface ipv4 set address name=%InterfaceName% source=static address=10.4.12.%ip% mask=255.255.255.128 gateway=10.4.12.1 gwmetric=0
    ) 

if "%mod%" equ "q" ( 
    exit
    ) 

ipconfig
pause