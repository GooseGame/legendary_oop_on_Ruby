@echo off
:: Для запуска скрипта надо передать bat-файлу путь к тестируемой программе
invert.rb "inSuccess3.txt" || goto err
fc "out.txt" "test-data/outSuccess3.txt" || goto err

invert.rb "inSuccess4.txt" || goto err
fc "out.txt" "test-data/outSuccess4.txt" || goto err

:: Тестируем неправильную матрицу
invert.rb "in3x4.txt" || goto err
fc "out.txt" "test-data/out3x4.txt" || goto err

invert.rb "inEmpty.txt" || goto err
fc "out.txt" "test-data/outFailed.txt" || goto err

echo All tests passed
@pause
exit /B 0

:err
echo Program testing failed
@pause
exit /B 1