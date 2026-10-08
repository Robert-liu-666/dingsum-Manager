@echo off
chcp 65001 >nul
cd /d "%~dp0frontend"
echo ============================================
echo  Dessert System - Frontend
echo  http://localhost:5173
echo  Press Ctrl+C to stop
echo ============================================
call npm run dev
pause
