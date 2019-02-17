load "stdFunc/init.rb"
load "stdFunc/output.rb"
initWithCheck(ARGV, 1, "Out.txt")
File.open(ARGV[0], "rb") do |file|
  binary = file.read(14)#читаем файловый заголовок
  data = binary.unpack("A2 L S S L")#декодируем сроку заголовка , где L - 4 байта, S - 2
  if data[0] = "BM"#проверяем тип файла
		binary = file.read(40)#если все хорошо читаем заголовок файла
		data = binary.unpack("L L L S S L L L L L L") #декодируем
		outP(data)
	else
		$StdOut.puts "File is not BMP"		
  end	
end