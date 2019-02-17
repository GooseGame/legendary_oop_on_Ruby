def outP(data) #инициализируем файлы ввода-вывода с проверками 
  $StdOut.puts "ширина изображения: #{data[0]}"
	$StdOut.puts "высота изображения: #{data[1]}"
	$StdOut.puts "количество бит на пиксель: #{data[4]}"
	if data[9] != '0'
		$StdOut.puts "количество цветов в палитре: #{data[9]}"
	end
	$StdOut.puts "размер в байтах: #{data[6]}"
	case data[5]
	when 1,2
		$StdOut.puts "RLE компрессия"
	when 4
		$StdOut.puts "Jpeg компрессия"
	when 5
		$StdOut.puts "PNG компрессия"		
	else		
  end
end