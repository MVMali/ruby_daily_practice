# Lambdas vs. Procs
# 1) A lambda cares about the number of arguments it receives.
#    A lambda will throw an error if passed the wrong number of arguments.
#    A Proc will ignore extra arguments and assign nil to missing arguments.
# 2) When a lambda returns, it passes control back to the calling mehtod
#    When a Proc returns, it triggers a return from the calling method
#    (similar behavior to a block)

my_proc = Proc.new { |name, age| puts "Your name is #{name} and you are #{age} years old." }
my_lambda = lambda { |name, age| puts "Your name is #{name} and you are #{age} years old." }

def do_stuff(&code)
  code.call("Boris", 25)
end

def do_more_stuff(&code)
  code.call("Boris")
end

do_stuff(&my_proc)
do_stuff(&my_lambda)
do_more_stuff(&my_proc)
# do_more_stuff(&my_lambda)

puts

my_proc = Proc.new { return "PROC RETURN" }
my_lambda = lambda { return "LAMBDA RETURN" }

def execute(&logic)
  puts "Starting execution..."
  puts logic.call
  puts "Ending execution..."
end

execute(&my_lambda)

puts

execute(&my_proc)

