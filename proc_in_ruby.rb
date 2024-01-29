#proc is nothing but code block which can be used in the methods
#Like code blocks Blocks it has no variable is assigned to it but
#in proc it is a ruby object so we can reuse this code block again and again
#Like Blocks it is not easy to deal with large logic to write multiple times in a code
#with the help of the Proc class we can declare the logic of the code block and can be reused
#wherever it is required.

#Proc is an object representation of block
#
get_ids = Proc.new{|name| "It contains critical information like #{name}"}


#To pass the proc object as code block use &

# p ["Works","Here"].map(&get_ids)

def make_tour(place_name,*multiple_procs)
  # p proc_handler_tour.call(place_name)
  # p proc_handler_travel.call(place_name)
  multiple_procs
end

proc_handler_tour = Proc.new{|place_name| "Place you are going to visit is #{place_name} thank you!!"}

proc_handler_travel = Proc.new{
  |place_name| "Ensure your travel should be smooth and reliable with #{place_name}"
}

make_tour("Leh",&proc_handler_tour){proc_handler_travel}
# make_tour("Kasoli"){|place_name| "You should come to #{place_name}"}
