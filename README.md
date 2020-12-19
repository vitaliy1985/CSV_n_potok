Обработка CSV в командной строке Windows в N поток

Processing CSV in the Windows command line in N thread


Подгоняем под свои поля для замены и пользуемся
Копируем файлы _CSV_content_replase.bat и _RUN.bat в папку с CSV-файлами и запускаем
Строки: 
if !переменная!==nulll set "переменная=" не удалять и не изменять

Скрипт внесения изменений в csv файл по контенту
поля %%a,%%b..,%%v идут по порядку, согласно структуре файла


Для внесения изменений необходимо присвоить соответствующее значение переменной в теле цикла


Переменная number_potok задает количество одновременно обрабатываемых файлов. 
Количество одновременно обрабатываемых файлов равно number_potok+1
По умолчанию number_potok=3, что означает до 4х одновременно обрабатываемых файлов.
Итоговое количество одновременно обрабатываемых файлов завичит от других процессов командной строки запущенных в системе во время работы скрипта!!!

We adjust to your fields for replacement and use Copy files _csv_content_replase.bat and _run.bat to the folder with CSV files and run the Lines: if !variable!==nulll set "variable=" do not delete or modify

Script for making changes to the csv file by content fields %%a,%%b..,%%v go in order, according to the file structure

To make changes, you must assign the appropriate value to the variable in the loop body

The number_potok variable specifies the number of files being processed simultaneously. The number of files being processed simultaneously is number_potok+1 By default, number_potok=3, which means up to 4 files being processed simultaneously. The total number of files processed at the same time depends on other command line processes running on the system while the script is running!!!