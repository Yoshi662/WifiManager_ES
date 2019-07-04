@echo off && cls
Title CMD WiFi Manager - Yoshi_662

set SSID="TempWifi"
set Pass="12345678"


echo.
echo ******************************************************************************
echo * ASEGURESE DE QUE ESTA EJECUTANDO ESTE SCRIPT CON PERMISOS DE ADMINISTRADOR *
echo ******************************************************************************
pause

:MENU
color 07
cls
echo.
echo Ajustes Actuales
echo SSID = %SSID%
echo PASS = %PASS%
echo.
echo Seleccione su opcion
echo 1 - Encender WiFi
echo 2 - Apagar WiFi
echo 3 - Configuracion por Defecto
echo 4 - Configurar Manualmente
echo 5 - Info Wifi
echo 6 - Ayuda (F.A.Q.)
echo 7 - Salir
echo.
choice /C 1234567 /D 7 /T 20 /N
if %errorlevel%==1 goto ON
if %errorlevel%==2 goto OFF
if %errorlevel%==3 goto AUTOCONFIG
if %errorlevel%==4 goto CONFIG
if %errorlevel%==5 goto INFOWIFI
if %errorlevel%==6 goto HELP
if %errorlevel%==7 goto FIN


:ON
cls
color 0a
echo Iniciando Wifi
echo.
netsh wlan start hostednetwork
echo.
netsh wlan show hostednetwork
echo.
echo Wifi Iniciada.
echo.
pause
goto Menu

:OFF
cls
color 0c
echo.
netsh wlan stop hostednetwork
echo.
echo Wifi Cerrada.
echo.
pause
goto MENU


:AUTOCONFIG
color 07
cls
echo.
echo Configurando Wifi
echo.
netsh wlan set hostednetwork mode=allow ssid=%SSID% key=%Pass%
echo.
echo Wifi Configurada.
echo.
pause
goto MENU

:CONFIG
color 07
cls
echo.
echo Introduce el SSID de la red
echo.
set /p SSID="SSID =  "
cls
echo Introduce la contrasena la red
echo La contrasena debe ser mayor de 8 caracteres
echo.
set /p pass="Contrasena  "
cls
goto autoconfig

:INFOWIFI
color 07
cls
echo.
netsh wlan show hostednetwork
pause
goto MENU

:HELP
color 07
cls
echo. 
echo Este script ayuda a usar su ordenador como red inalambrica de una forma sencilla.
echo Viene con una configuracion por defecto, Esta al principio de este mismo script.
echo Para que funcione, debes abrir primero las opciones del adapatdor de red y asegurarte
echo de que tu adaptador con conexion a internet esta compartiendo el acceso con "Conexion de area local XX"
echo. 
echo. 
pause
goto MENU

:FIN
color && cls
