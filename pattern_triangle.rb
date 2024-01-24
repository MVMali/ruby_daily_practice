# Assignment_2: Pattern Design in Ruby
# Write a Ruby program that takes an integer input from the user and prints a pattern based on that input.
# For this assignment, implement a program that prints a right-angled triangle pattern using asterisks (*).
#  The number of rows in the triangle should be determined by the user input.

def print_pattern(rows)
  (1..rows).each do |i|

    (1..i).each do |j|
      print "*"
      
    end
    puts
  end
end

puts "Give number of rows"
rows = gets.chomp.to_i

print_pattern(rows)
