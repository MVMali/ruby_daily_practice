#This file contains the use of include , load and mixins
#

puts "5"
puts 5
p 5
p "5"
#difference between the puts and p is that p gives more detailed output for debugging purpose and
#puts method simply puts data to console with newline .


module Pattern
  def greeting
    p "Hello it is p to print more detailed output"
  end
end

class Teama
  include Pattern
  def what_is_mixins
    puts "Mixins is way to introducing a modules in a class"
  end
end

intern_a = Teama.new
intern_a.greeting
intern_a.what_is_mixins
