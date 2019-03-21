load "stdFunc/init.rb" 

class Html
  def htmlDecode(line)#обрабатываем строку за 1 проход цикла
    outLine = String.new
    ignoreIterations = 1
    for i in 0..line.size
      if ignoreIterations != 1 #пропуск ненужных итераций
        ignoreIterations-=1
        next
      end  
      if line[i...i+'&quot;'.length] == '&quot;'
        outLine+='"'
        ignoreIterations = '&quot;'.length
      elsif line[i...i+'&apos;'.length] == '&apos;'
        outLine+="'"
        ignoreIterations = '&apos;'.length
      elsif line[i...i+'&lt;'.length] == '&lt;'
        outLine+='<'
        ignoreIterations = '&lt;'.length
      elsif line[i...i+'&gt;'.length] == '&gt;'
        outLine+='>'
        ignoreIterations = '&gt;'.length
      elsif line[i...i+'&amp;'.length] == '&amp;'
        outLine+='&'
        ignoreIterations = '&amp;'.length
      else #если обычный текст
        if line[i]!=nil
          outLine+=line[i]
        end 
      end 
    end   
      return outLine     
  end 
end  

def output(outputString)
  if $isAutoTest == true
    $stdOut.puts outputString
  else  
    puts outputString
  end 
end  

initFiles(ARGV, 1)
$StdIn.each do |line|
  output(Html.new.htmlDecode(line))
end