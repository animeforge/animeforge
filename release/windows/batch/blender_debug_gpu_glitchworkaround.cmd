@echo off
echo Starting animeforge with GPU debugging and glitch workaround options, log files
echo will be created in your temp folder, windows explorer will open after you 
echo close animeforge to help you find them.
echo.
echo If you report a bug on https://projects.animeforge.org you can attach these files
echo by dragging them into the text area of your bug report, please include both
echo animeforge_debug_output.txt and animeforge_system_info.txt in your report.
echo.
pause
mkdir "%temp%\animeforge\debug_logs" > NUL 2>&1
echo.
echo Starting animeforge and waiting for it to exit....
set PYTHONPATH=
"%~dp0\animeforge" --debug --debug-gpu --debug-gpu-force-workarounds --python-expr "import bpy; bpy.ops.wm.sysinfo(filepath=r'%temp%\animeforge\debug_logs\animeforge_system_info.txt')" > "%temp%\animeforge\debug_logs\animeforge_debug_output.txt" 2>&1 < %0
explorer "%temp%\animeforge\debug_logs"
