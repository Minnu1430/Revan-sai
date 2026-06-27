@echo off
title Smart Classified AI Launcher
echo ==============================================================
echo        LAUNCHING SMART CLASSIFIED AI FULL-STACK PLATFORM
echo ==============================================================
echo.
echo [1/3] Database Checklist:
echo The application is configured to run fully on a file-based database (JSON + text logging).
echo No MySQL, SQLite, or external SQL database server setup is required!
echo.

echo [2/3] Starting Backend API Server in a new window...
start "Smart Classified AI Backend" cmd /k "cd backend && echo Installing backend packages... && npm install --legacy-peer-deps && echo Starting server... && npm run dev"

echo [3/3] Starting Frontend Dev Server in a new window...
start "Smart Classified AI Frontend" cmd /k "cd frontend && echo Installing frontend packages... && npm install --legacy-peer-deps && echo Starting Vite development server... && npm run dev"

echo.
echo ==============================================================
echo  Startup commands dispatched! Check the new windows for status.
echo  Backend:  http://localhost:5000
echo  Frontend: http://localhost:5173
echo ==============================================================
echo.
pause
