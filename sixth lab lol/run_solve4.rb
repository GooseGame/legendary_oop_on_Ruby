load "solve4.rb"

while (true and !$stdin.eof()) do  
  coeffs = gets.chomp().split(' ')
  solution = solve4(coeffs[0].to_f, coeffs[1].to_f, coeffs[2].to_f, coeffs[3].to_f, coeffs[4].to_f)
  puts solution
  if solution[0]==nil and solution[1]==nil and solution[2]==nil and solution[3]==nil
    raise StandardError.new('Equation has no solution (x1..x4 = nil)')    
  end 
end  