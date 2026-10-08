@echo off
chcp 65001 >nul
cd /d "%~dp0backend"
echo ============================================
echo  Dessert System - Backend
echo  http://localhost:8080
echo  Press Ctrl+C to stop
echo ============================================
java -jar target\prj-backend-0.0.1-SNAPSHOT.jar
pause
