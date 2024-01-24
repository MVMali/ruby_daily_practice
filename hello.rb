# print "Hello my name is Mohan Mali , I currently pursing my B-tech final year from COEP pune.\n"

# def add(a,b)
#     return a+b
# end
# # puts add(a,b)
# puts "Hello World";
# a = 10
# b = 12
# c = a+b;
# puts "The sum of #{a} + #{b} is #{c}"

# puts "Sum of #{a} and #{b} is #{add(a,b)}"


# grade = 88
# if grade>90
#     puts "A+"
# elsif grade>75 && grade < 90
#     puts "A"
# else
#     puts "B+"
# end

# puts (1..10).to_a
# puts (1...10).to_a

# for i in (1...10).to_a
#     print(i)
# end



# a = 0
# 1.upto(3) do |i|
#   a += i
#   b = i*i
#   puts a
# end

# puts a


# threads = []

# ["one", "two"].each do |name|
#   threads << Thread.new do
#     local_name = name
#     a = 0
#     3.times do |i|
#       Thread.pass
#       a += i
#       puts "#{local_name}: #{a}"
#     end
#   end
# end

# threads.each {|t| t.join }

# def add_one(number1)
#     number1+=1

#     puts "Object id is #{number1.object_id}"
# end
# a = 2
# b= a
# b += 1
# # add_one(a)
# puts "a.object.id #{a.object_id}"
# puts "b.object.id #{b.object_id}"



# puts "example".capitalize!
# puts "example two".swapcase!
# puts "example three".reverse
# def print_phrase(phrase)
#     puts phrase
# end
# print_phrase("learning Ruby")


#parenthesis are optional in the function parameters
# def method_name a,b,c,d
#     puts a,b,c,d
#   end
# method_name 1,2,3,4


# puts 12.object_id
# puts 12.is_a?(Integer)
# puts '12'*12


# def change_string(hostelName)
#     hostelName = "COEP Hostel"
#     puts hostelName.object_id
#     return hostelName
# end

# def change_touppercase(hostelname)
#     hostelname<<"Pune"
#     hostelname.upcase!
#     puts hostelname.object_id

# end

# hostelname = "coe hostel"
# # hostelname = change_string(hostelname)
# # puts hostelname.object_id
# change_touppercase(hostelname)
# puts hostelname.object_id
# puts hostelname
# #To make changes into string calling method should end with !
# puts hostelname.class

# def foo(*all)
#     all.each do |element|
#         puts element
#     end
# end

# numbers = [1,2,3,4,5]
# foo(*numbers)

# array_obj = [1,[2,3,["Ruby","Rails",["12","3"]]],"mike"]
# # puts array_obj.flatten
# puts array_obj.shift(2)

# puts array_obj


#Ranges

# (1..10).each do |s|   #inclusive
#     print(s)
# end
# puts
# (1...10).each do |s|   #exclusive
#     print(s.object_id)
# end
# puts
# inclusive = 1..10
# arr =[*inclusive]
# puts arr

#Constants

# T = 42
# T= 23

# roman_nums = {1=>"I",2=>"II",3=>"III",4=>"IV",5=>"V",6=>"VI",7=>"VII",8=>"VIII",9=>"IX",10=>"X"}
# num = gets

#conditional statements
#if else elsif unless case

# count = gets
# count = count.to_i
# puts count.class
# case
# when count ==0
#     puts "I have #{count} cars"
# when (1..3).include?(count)
#     puts "I have Sport car"
# else
#     puts "I have Transport  vehicles #{count}"
# end


#loops
# i = 5
# loop do
#     break if i<0
#     puts i
#     i-=1
# end

#Code Blocks
# 5.times {puts "Pattern"}
#curly brace format for the blocks that return data,no changes

#Do-end format for Multiline blocks, blocks perform actions and make changes.

#Find methods
# puts (1..10).find{|n| n==5}
# puts (1..10).find_all{|n| n%3==0}
# puts (1..10).any?{|n| n==5}
# puts (1..10).none?{|n| n==5}

# numbers = [*1..10]
# numbers.delete_if{|n| n<=5}
# print(numbers)

#Map methods
# number = [1,2,3,4,5]
# x = number.map!{|n| n+1}
# y = number.map{|n| n**2}
# print(y)

# items = {low:2,high:4}
# z = items.map { |k,v|
#     "#{k.capitalize}:#{v*10}"
# }
# print(z)
#Map returns always an array it's no more hash
# fruits = ["chiku","peru","angur"]
# fruits.map! do |item|
#     item = "mango" if item == "chiku"

# end

# fruits.map! do |item|
#     item == "chiku"?item = "mango":item
#     item.capitalize

# end
# print(fruits)

#inject method act like a accumalator
# numbers = [1,2,3,4,5]
# x=numbers.inject{|memo,n| memo+n}
# print(numbers)
# print(x)

# bikes = ["apache200","kawasakininja","Honda","R15"]
# x = bikes.inject(["Splender"]){|memo,item| memo.append(item.capitalize)}
# puts x

# x = [[:student, "Terrance Koar"], [:course, "Web Dev"]].inject({}) do |result, element|
#     result[element.first] = element.last
#     result
# end
# puts x

#Sort method
# numbers = [1,4,2,6,3]
# x = numbers.sort{|v1,v2| v1<=>v2}
# x = numbers.sort{|v1,v2| v2<=>v1}

# fruits = ["chiku","peru","angur"]
# x = fruits.sort
# # x = fruits.sort_by{|fruit| fruit.length}
# x = fruits.sort do |fruit1,fruit2|
#     fruit1.length<=>fruit2.length
# end
# print(x)

# rankhash = {red:"2",blue:"4",yellow:"1"}
# x = rankhash.sort {|item1,item2|
#     item1[0]<=>item2[0]
# }
# x = rankhash.sort {|item1,item2|
#     item1[1]<=>item2[1]
# }
# print(x)


#merge method
#used for hashesh only
#merges two hashes

rankhash1 = {red:"2",blue:"4",yellow:"1"}
rankhash2 = {red:"3",blue:"6",yellow:"1"}
puts rankhash1.merge(rankhash2)

puts rankhash1.merge(rankhash2){|k,o,n| (o.to_i+n.to_i).to_s}
