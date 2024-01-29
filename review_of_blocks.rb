# BLOCKS
#
# A block is a chunk of code to execute.
# An argument is an object we pass a method, while a block is a procedure
# A block cannot exist without a method.
# A block is a temporary construct.
#
# BLOCKS VS METHODS
#
# Methods can be invoked over and over.
# A block is used only once, then disappears.
# Methods capture the repeatable steps of a procedure.
# A block captures the custom step of a procedure.

# [1, 2, 3].each { |value| p value }
# p [1, 2, 3].map { |value| value ** 2 }


def pattern
  puts "This yield excutes the block of code"
  puts yield
  a = yield
  puts "Block of code can return the value and it is usefull here #{a}"
  yield
end

# pattern{" A block is simply a chunk of code, and yield allows us to inject that code at some place into a method."}

# pattern do
#   "Ruby"
#   "block of code"
#   puts "Methods consist of a name, but with blocks we don't need to write a name, and always pass to a method call"
# end

def block_given_method
  print "This block_given check if the block is given or not depending on that it throws exeption\n"
  if block_given?
    yield
  end
end

# block_given_method{puts "Heyy the block is given"}

#block parameters passing

def passing_block_params(name)
  yield(name,"Nice gesture")
end

# passing_block_params("Ram"){|name,sent| puts "#{name} you have #{sent}"}

#custom_each method
def custom_each(elements)
  i = 0
  while i < elements.length
    yield elements[i]
    i += 1
  end
end

# custom_each([4,5,6]){|item|puts "Revenue in crores is #{item}"}

def custom_map(elements)
  arr = []
  i = 0
  while i < elements.length
      x = yield elements[i]
      arr.push(x) # or arr << x
      i += 1
  end
  return arr
end

# custom_map([1,2,3]){|number| number*3}
