def initFiles(consoleArr, argsCount) #инициализируем файлы ввода-вывода с проверками 
  if consoleArr.length < argsCount #проверка на наличие всех необходимых аргументов в консоли
  puts "too few arguments"
  exit
end 
  if consoleArr.length == 2
    $stdOut = File.open(consoleArr[1], 'w')
    $isAutoTest = true
  else
    $isAutoTest = false
  end    #открытие файлов в глобальные переменные типа File
  $StdIn = File.open(consoleArr[0].to_s, 'r:bom|utf-8')

  if !File.readable?($StdIn)
    $StdOut.puts "cant read file"
    exit
  end   
  if File.empty?($StdIn)
    $StdOut.puts "file is empty"
    exit
  end  
end