@echo off
:: Для запуска скрипта надо передать bat-файлу путь к тестируемой программе
radix.rb "10" "11" "10" || goto err
fc "out.txt" "test-data/outSuccess.txt" || goto err

radix.rb "10" "36" "1234567887654321234567898765432123456789876543223456789876543234567876543234765432345676543234567876543234567876543234589876543876329876432456789876543467898643567898765434567890987654" || goto err
fc "out.txt" "test-data/outSuccessBN.txt" || goto err

:: Тестируем пустое имя
radix.rb "10" "12" "A" || goto err
fc "out.txt" "test-data/outFailed.txt" || goto err

echo All tests passed
@pause
exit /B 0

:err
echo Program testing failed
@pause
exit /B 1