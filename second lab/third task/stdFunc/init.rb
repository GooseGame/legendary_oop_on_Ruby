def initWithCheck(consoleArr, argsCount, out) #инициализируем файлы ввода-вывода с проверками 
  if consoleArr.length < argsCount #проверка на наличие всех необходимых аргументов в консоли
  puts "too few arguments"
  exit
end 
  if consoleArr.length == 2
    $StdOut = File.open(out, 'w') #открытие файлов в глобальные переменные типа File
    $isAutotest = true
  else
    $isAutotest = false
  end    
  $StdIn = File.open(consoleArr[0].to_s, 'r')
  if !File.readable?($StdIn)
    $StdOut.puts "cant read file"
    exit
  end   
  if File.empty?($StdIn)
    $StdOut.puts "file is empty"
    exit
  end  
end

def makeMapContainer()
  hashMap = Hash.new
  $StdIn.each do |line|
    engWord = line.scan(/[a-zA-Z]+/)
    rusWords = line[line.index(':')+1..line.length].split(',')
    rusWords[0] = rusWords[0].encode("UTF-8")  
    hashMap[engWord.to_s] = rusWords
  end  
  $StdOut.puts hashMap
end    