@echo off
echo Building WellMom...
cd /d D:\grinding\Lomba\innovilage\WellMom\wellmom_app
call flutter build apk --debug
echo Installing to device...
adb install -r android\app\build\outputs\apk\debug\app-debug.apk
echo Launching app...
adb shell am start -n com.wellmom-innovilage.wellmom_app/.MainActivity
echo Done!
pause