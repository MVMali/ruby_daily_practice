# Data Encapsulation
# Data Abstraction
# Polymorphism
# Inheritance

#Polymorphism using Inheritance
class Calculator
  def Add(a,b)
    puts "Sum in Calculator is #{a+b}"
  end
end

class FaultiCal < Calculator
  def Add(a,b)
    super     #using this super keyword the parent class method is called which is defined here is Add
    puts "Sum in FaultiCal is #{a-b}"  #subtraction
  end
end

# obj1 = FaultiCal.new
# obj1.Add(4,5)


# Ruby program of polymorphism using Duck typing

# Creating three different classes
class Hotel

  def enters
    puts "A customer enters"
  end
  def person_info(customer)
    customer.person_info
  end

  def type(customer)  #This function takes the object as the input and call the method on that object
    customer.type
  end

  def room(customer)
    customer.room
  end

  end

  # Creating class with two methods
class Single
  def initialize(name,mobileno)
    @name = name
    @mobileno = mobileno
  end

  def person_info
    puts "Name of customer is #{@name} and Contact number #{@mobileno}"
  end

  def type
    puts "Room is on the fourth floor."
  end
  def room
    puts "Per night stay is 5 thousand"
  end
end

class Couple

  # Same methods as in class single
  def type
    puts "Room is on the second floor"
  end

  def room
    puts "Per night stay is 8 thousand"
  end

  end

  # Creating Object
  # Performing polymorphism
  # hotel= Hotel.new
  # puts "This visitor is Single."
  # customer = Single.new
  # hotel.type(customer)
  # hotel.room(customer)


  # puts "The visitors are a couple."
  # customer = Couple.new
  # hotel.type(customer)
  # hotel.room(customer)

# ihotel = Hotel.new
# #object ihotel is created
# ihotel.enters
# pt1 = Single.new("Rohit","182932")
# pt1.person_info  #This information is for that person only If
# #If we want to store the this object in the database and want to acces the persons information
# #then we need to create polymorphism beacause by creating the Hotel class we can able to access the
# #information regarding that object .
# ihotel.person_info(pt1)  #


#Ruby does not support method overloading as it support dynamic binding , not static binding it is difficult to
#make sure which variable type it is .

# class Klass
#   attr_accessor :str
# end
# s1 = Klass.new      #=> #<Klass:0x401b3a38>
# s1.str = "Hello"    #=> "Hello"
# s2 = s1.clone       #=> #<Klass:0x401b3998 @str="Hello">
# s2.str[1,4] = "i"   #=> "i"
# puts s1.inspect          #=> "#<Klass:0x401b3a38 @str=\"Hi\">"
# puts s2.inspect          #=> "#<Klass:0x401b3998 @str=\"Hi\">"


#Understanding clone and dup
#Dup copy the object by ignoring it's attributes while clone copy object at it is. Both of them makes shallow copy
#object's attributes are
#frozen status
#tained status
#singleton status

# a = Object.new.freeze

# b = a.dup
# puts b.frozen?
# # false

# b = a.clone
# a.clone(freeze: true)
# b = a.clone(freeze: false)
# puts b.frozen?
# true

# a = "123"
# b = a  #upto here same object id
# puts a.object_id
# puts b.object_id
# b[0] = "0"
# puts a
# puts b.object_id
#here both the a and b variables referencing to objects are changing
#So changes in a visible in b
#To avoid this we use dup and clone

