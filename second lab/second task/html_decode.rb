load "stdFunc/init.rb"   
def htmlDecode(line)#обрабатываем строку за 1 проход цикла
  outLine = ''
  counter = 0
  for i in 0..line.size
    if counter != 0 #пропуск ненужных итераций
      counter-=1
      next
    end  
    if line[i...i+6] == '&quot;'
      outLine+='"'
      counter = 5
    elsif line[i...i+6] == '&apos;'
      outLine+="'"
      counter = 5 
    elsif line[i...i+4] == '&lt;'
      outLine+='<'
      counter = 3
    elsif line[i...i+4] == '&gt;'
      outLine+='>'
      counter = 3
    elsif line[i...i+5] == '&amp;'
      outLine+='&'
      counter = 4
    else #если обычный текст
      if line[i]!=nil
        outLine+=line[i]
      end 
    end 
  end   
    return outLine     
end 

def output(result)
  if $isAutoTest == true
    $stdOut.puts result
  else  
    puts result
  end 
end  

initFiles(ARGV, 1)
$StdIn.each do |line|
  output(htmlDecode(line))
  #puts htmlDecode(line)
end