echo off

SetLocal EnableExtensions EnableDelayedExpansion

rem Если каталог new отсутствует, то создаем его
if not exist new md new	

rem получаем список cmd и подсчитываем их количество до начала преобразования
set number_first=0
for /f "delims=" %%a in ('tasklist /FI "IMAGENAME eq cmd.exe" /NH') do (
	set /a number_first+=1
)
ping -n 5 127.0.0.1 >nul

rem Примерное число потоков: n+1. Можно менять!!!!!!!!!!!!!!!!!!!
set number_potok=3

rem Получаем ограничение на количество запущенных потоков
set /a bound = %number_potok%+%number_first%

rem Команда закрытия новых окон
set close_window=exit

rem перебираем все файлы с расширением csv в текущей папке
for %%a in (*.csv) do (	
	rem получаем список cmd и подсчитываем их количество после начала преобразования
	set number_last=0
	for /f "delims=" %%a in ('tasklist /FI "IMAGENAME eq cmd.exe" /NH') do (
		set /a number_last+=1
	)
	rem если уже файл существует, то удаляем его
	if exist new\%%a del new\%%a
	ping -n 5 127.0.0.1 >nul

	rem Если текущее количество процессов cmd меньше первоначального количества процессов cmd, то запускаем
	rem выполнение в новом процессе cmd
	rem Если больше или равно, то в текущем
	if !number_last! LSS %bound% (	
		rem ping -n 1 127.0.0.1 >nul
		call start /MIN _CSV_content_replase.bat %%a %close_window%
		) else (
			ping -n 20 127.0.0.1 >nul
			call _CSV_content_replase.bat %%a
			)	
)





