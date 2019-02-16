@echo off
:: Для запуска скрипта надо передать bat-файлу путь к тестируемой программе
invert.rb "inSuccess3.txt" || goto err
fc "out.txt" "test-data/out/outSuccess3.txt" || goto err

invert.rb "inSuccess3(2).txt" || goto err
fc "out.txt" "test-data/out/outZero.txt" || goto err

invert.rb "inSuccess3(3).txt" || goto err
fc "out.txt" "test-data/out/outSuccess3Bigger.txt" || goto err

:: Тестируем неправильную матрицу
invert.rb "in3x4.txt" || goto err
fc "out.txt" "test-data/out/out3x4.txt" || goto err

invert.rb "inEmpty.txt" || goto err
fc "out.txt" "test-data/out/outFailed.txt" || goto err

echo All tests passed
@pause
exit /B 0

:err
echo Program testing failed
@pause
exit /B 1