echo off

SetLocal EnableExtensions EnableDelayedExpansion

	set filename=%1
	set close_window=%2
	
	for /F "usebackq tokens=* " %%a in (!filename!) do (
				rem Создаем переменную stroka и записываем в нее значение n-й строки
				set stroka=%%a
				rem Заменяем в переменной stroka значения ,, на ,nulll, чтобы строка правильно распарсилась,
				rem т.к. в командной строке не распознаются значения null
				set stroka=!stroka:,,=,nulll,!
				rem Если значение первого поля null, то присваиваем ему значение nulll
				set str=!stroka!
				set str=!str:~0,1!
				if "!str!"=="," set stroka=nulll!stroka!
				
				rem Если значение последнего поля null, то присваиваем ему значение nulll
				set str=!stroka!
				set str=!str:~-1!
				if "!str!"=="," set stroka=!stroka!nulll
				
				for /f "tokens=1-25 delims=," %%a in ('echo !stroka!') do (					
					
					set	pole1=%%a
					if !pole1!==nulll set "pole1="

					set	pole2=%%b
					if !pole2!==nulll set "pole2="
					
					set	pole3=%%c
					if !pole3!==nulll set "pole3="
					
					set	pole4=%%d
					if !pole4!==nulll set "pole4="
					
					set	pole5=%%e
					if !pole5!==nulll set "pole5="
					
					set	pole6=%%f
					if !pole6!==nulll set "pole6="
					
					set	pole7=%%g
					if !pole7!==nulll set "pole7="
					
					set	pole8=%%h
					if !pole8!==nulll set "pole8="
					
					set	pole9=%%i
					if !pole9!==nulll set "pole9="
					
					set	pole10=%%j
					if !pole10!==nulll set "pole10="					
					
					set	pole11=%%k
					if !pole11!==nulll set "pole11="
					if %%k==ZN1 (
						set pole11=ZN2
					) else set pole11=ZN3
					
					set	pole12=%%l
					if !pole12!==nulll set "pole12="
					
					set	pole13=%%m
					if !pole13!==nulll set "pole13="
					
					set	pole14=%%n
					if !pole14!==nulll set "pole14="
					
					set	pole15=%%o
					if !pole15!==nulll set "pole15="
					
					set	pole16=%%p
					if !pole16!==nulll set "pole16="
					if "%%p"=="ppppp" ( 
						set pole16=ZN1
										) else ( 
											if "%%p"=="ZN 2" ( set pole16=ZN2
												) else if "%%p"=="ZN 3" set pole16=ZN2
																) 	
					
					set	pole17=%%q
					if !pole17!==nulll set "pole17="
					
					set	pole18=%%r
					if !pole18!==nulll set "pole18="
					
					set	pole19=%%s
					if !pole19!==nulll set "pole19="
					
					set	pole20=%%t
					if !pole20!==nulll set "pole20="
					
					set	pole21=%%u
					if !pole21!==nulll set "pole21="
					
					set	pole22=%%v
					if !pole22!==nulll set "pole22="
					
					set	pole23=%%w
					if !pole23!==nulll set "pole23="
					
					set	pole24=%%x
					if !pole24!==nulll set "pole24="
					
					set	pole25=%%y
					if !pole25!==nulll set "pole25="						
					
					echo !pole1!,!pole2!,!pole3!,!pole4!,!pole5!,!pole6!,!pole7!,!pole8!,!pole9!,!pole10!,!pole11!,!pole12!,!pole13!,!pole14!,!pole15!,!pole16!,!pole17!,!pole18!,!pole19!,!pole20!,!pole21!,!pole22!,!pole23!,!pole24!,!pole25!>> %CD%\new\!filename!
				
				rem Выводим путь\имя нового файла
				rem echo %CD%\new\!filename!
				)
	)
%close_window%
	