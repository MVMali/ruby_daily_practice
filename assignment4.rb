#This file contains the use of include , load and mixins
#


#difference between the puts and p is that p gives more detailed output for debugging purpose and
#puts method simply puts data to console with newline .


module Pattern
  def greeting
    p "Hello it is p to print more detailed output"
  end

  def give_me_diff_bet_p_and_puts
    puts "5"
    puts 5
    p 5
    p "5"
  end

  def why_to_use_modules
    puts "As Ruby does not have multiple inhertitance but there are some situations where we need multiple inheritance
    "
  end
end

class Teama
  include Pattern
  extend Pattern  #this causes the class itself to access the methods present in the modules.
  def what_is_mixins
    puts "Mixins is way to introducing a modules in a class"
  end
end

intern_a = Teama.new
intern_a.greeting
intern_a.what_is_mixins
Teama.greeting
