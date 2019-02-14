@echo off
:: Для запуска скрипта надо передать bat-файлу путь к тестируемой программе
findtext.rb "inSuccess.txt" goose || goto err
fc "out.txt" "test-data/outSuccess.txt" || goto err

findtext.rb "inSuccess.txt" NotGoose || goto err
fc "out.txt" "test-data/outFailed.txt" || goto err

:: Тестируем пустое имя
findtext.rb "inEmpty.txt" goose || goto err
fc "out.txt" "test-data/outFailed.txt" || goto err

echo All tests passed
@pause
exit /B 0

:err
echo Program testing failed
@pause
exit /B 1