#variables and classes and objects
#

#variables have the four types in Ruby
#Variables are used to keep track of objects; each variable holds a reference to an object.

# x = "2"
# puts x.object_id
# puts x.class
# puts x

# A variable is simply a reference to an object. Objects float
# around in a big pool somewhere (the heap, most of the time) and are pointed to by variables.

#dup for objects
# a = 1
# b = a.dup
# a = 2
# puts a
# puts b
#
# $	global variable
# @	instance variable
# [a-z] or _	local variable
# [A-Z]	constant

# One nice feature of a global variable is that it can be traced; you can specify a procedure which is invoked whenever the value of the variable is changed.
#https://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/globalvars.html
# $x = 10
# trace_var :$x, proc{print "$x is now ", $x, "\n"}
# $x = 12

#$$ contains the process id of the ruby interpreter

#https://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/instancevars.html
#An instance variable has a name beginning with @, and its scope is confined to whatever
#object self refers to. Two different objects, even if they belong to the same class,
#are allowed to have different values for their instance variables. From outside the object,
#instance variables cannot be altered or even observed (i.e., ruby's instance variables are never public)
# except by whatever methods are explicitly provided by the programmer. As with globals,
#instance variables have the nil value until they are initialized.


# class InstTest
#     # attr_writer :foo
#     #attr_read :foo
#     # attr_accessor :foo
#      def set_foo(n)
#        @foo = n
#       #  puts @foo.object_id
#      end
#      def set_bar(n)
#        @bar = n
#      end
#      def get_foo
#       puts @foo
#      end
#      def get_bar
#       puts @bar
#      end
#      def set_newfoo(n)
#       @foo = n
#       puts @foo.object_id
#      end
#    end
# i = InstTest.new
# i.set_foo(12)
# i.set_bar(2)
# i.get_bar
# i.set_newfoo(10)
# i.get_foo
# puts i.foo  #gives an error beacause the instance variable is not accessible outside the class by default
#use of attr_reader we can read the value similar to attr_write
# i.foo = 14
# puts i.foo
# puts i.instance_variables


# A local variable is only accessible within the block of its initialization. Local variables are not available outside the method.
#There is no need to initialize the local variables.

#Class Variables: A class variable name always starts with @@ sign.It is available across different objects.
#A class variable belongs to the class and it is a characteristic of a class.
#They need to be initialized before use.
#Another way of thinking about class variables is as global variables within the context of a single class.
# A class variable is shared by all the descendants of the class.
#An uninitialized class variable will result in an error.
# $global_variable = 10
# class Class1
#  def print_global
#  puts "Global variable in Class1 is #$global_variable"
#  end
# end
# class Class2
#  def print_global
#  puts "Global variable in Class2 is #$global_variable"
#  end
# end
# class1obj = Class1.new
# class1obj.print_global
# class2obj = Class2.new
# class2obj.print_global

# https://www.geeksforgeeks.org/method-overloading-in-ruby/?ref=ml_lbp

# class Test
# 	def self.sum(a,b)
# 		puts(a+b)
# 	end
# 	def self.sum(a,b,c)
# 		puts(a+b+c)
# 	end

# end
# Test.sum(1,2)

# In Ruby, when a second method is defined with the same name it completely overrides the previously existing method.
# The previous method is no longer accessible and hence throws error when we try to access it.

# class Test
# 	def self.sum(a,b)
# 		puts(a+b)
# 	end
# 	def self.sum(a,b,c)
# 		puts(a+b+c)
# 	end

# end
# Test.sum(1,2,7)
# class Test
# 	def self.display(*args)
# 		case args.size
# 			when 1
# 				puts "1: Hello #{args[0]}"
# 			when 2
# 				puts "2: Hello #{args[0]} #{args[1]}"
# 			when 3
# 				puts "3: Hello #{args[0]} #{args[1]} Welcome to #{args[2]} language."
# 		end
# 	end
# end
# puts "Overloading using Class Method"
# Test.display"Geeks!!"
# Test.display"Geeks!!", "Hope you doing great."
# Test.display"Geeks!!", "Hope you doing great.", "Ruby"

# program to illustrate protected access modifier

# super class
# class Parent
# 	protected
# def protectedMethod
# 		puts "protectedMethod called!"
# 	end

# end

# class Geeks < Parent

# def publicMethod
# 	self.protectedMethod
# end

# end

# obj = Geeks.new
# obj.publicMethod

# Declaring a module to greet a person
module Greetings

  def self.included(person_to_be_greeted)

    puts "The #{person_to_be_greeted} is welcomed with an open heart !"
  end
end


#   # Class where the module is included
class Person
  include Greetings # implementation of the include statement
end

#struct class
# Customer = Struct.new(:name,:hobby) do
#   def infop
#     puts "#{name} and #{hobby}"
#   end
# end
# p1 = Customer.new("xyz","abc")
# p1.infop
Customer = Struct.new(:name, :address, keyword_init: true)
Customer.new(name:"Dave", address: "123 Main")
