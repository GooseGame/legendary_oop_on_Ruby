load "solve4.rb"

while (true and !$stdin.eof()) do  
  coeffs = gets.chomp().split(' ')
  solution = solve4(coeffs[0].to_f, coeffs[1].to_f, coeffs[2].to_f, coeffs[3].to_f, coeffs[4].to_f)
  puts solution
end  