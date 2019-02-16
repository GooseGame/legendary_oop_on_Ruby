load "stdFunc/init.rb"
load "stdFunc/initAndFillArray.rb"
load "stdFunc/inverting.rb"

initWithCheck(ARGV, 1, "Out.txt")

arr = Array.new
initAndFillArr(arr)#заполняем из файла

det = determinant(arr)
transpanent(arr)
arr = countAll2x2(arr)#создаем матрицу кофакторов
arr = makeInverted(arr, det)#инвертируем по формуле
makeRound(arr, 1000)#округлим до 3х знаков
#$StdOut.puts arr.to_s
makeOutput(arr)#выведем массив в престойном виде  


#puts arr.to_s

#$StdOut.puts Matrix[*arr]  	
$StdIn.close
$StdOut.close

