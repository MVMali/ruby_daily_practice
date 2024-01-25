class Foo
  def hello
    puts "hello"
  end
end

foo = Foo.new
foo.hello  # => "hello"

class << foo
  attr_accessor :name

  def hello
    puts "hello, I'm #{name}"
  end
end

foo.name = "Tom"
foo.hello         # => "hello, I'm Tom"
Foo.new.hello     # => "hello"

# Ruby program to understand include and extend

# Creating a module contains a method
module Geek
  def prints(x)
    puts x
  end
  end

class GFG

# by using both include and extend
# we can access them by both instances
# and class name.
include Geek
extend Geek
end

# access the prints() in Geek
# module by include in Lord class
GFG.new.prints("Howdy") # object access

# access the prints() in Geek
# module by extend it in Lord class
GFG.prints("GeeksforGeeks!!") # class access

#by using include method , only the instance objects can call this methods
#where extend methods can only applicable to classes can call it.
