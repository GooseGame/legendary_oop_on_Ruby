def initWithCheck(consoleArr, argsCount, out) #инициализируем файлы ввода-вывода с проверками 
  if consoleArr.length < argsCount #проверка на наличие всех необходимых аргументов в консоли
  puts "too few arguments"
  exit
end 
  $StdOut = File.open(out, 'w') #открытие файлов в глобальные переменные типа File
  $StdIn = File.open(consoleArr[0].to_s, 'r')
  if !File.writable?($StdOut)
    puts "cant write in file"
    exit
  end 
  if !File.readable?($StdIn)
    $StdOut.puts "cant read file"
    exit
  end   
  if File.empty?($StdIn)
    $StdOut.puts "file is empty"
    exit
  end  
  return $StdOut, $StdIn
end