#reference taken for date validation https://stackoverflow.com/questions/5978510/regex-to-match-date
#https://stackoverflow.com/questions/36191001/how-to-sort-hash-keys-by-their-value-in-ruby-2-3-0

require 'date'

class Calender
  def initialize
    @hash_calender = {}
    @title = ""
    @description = ""
    @event_date = ""

  end

  def create_event(title,event_date,description)
    @title = change_title_into_snake_case(title)

    validate_duplicate_title(@title)

    validate_date_format(event_date)

    @description = description

    hash_inner={}
    hash_inner.store("event_date",@event_date)
    hash_inner.store("description",@description)
    @hash_calender.store(@title,hash_inner)

    @title = ""
    @description = ""
    @event_date = ""

  end

  def display_events
    print @hash_calender
    sorted_events = @hash_calender.sort_by{|k,v|
      v["event_date"]
    }

    sorted_events.each do |key,value|
      key = key.split("_")
      item = ""

      key.each do |i|
        item += i.capitalize + " "
      end

      print "Title:#{item}\n"
      print "Date: #{value["event_date"]} \nDescription: #{value["description"]}\n"
      puts
    end

  end

  def remove_event(title)
    temp = change_title_into_snake_case(title)
    if @hash_calender[temp]
      @hash_calender.delete(temp)
    else
      puts "Title #{title} not present in calender!!"
    end
  end

  private
  def change_title_into_snake_case(title)
    title = title.split
    temp = ""
    title.each do |item|
      temp = temp + item.downcase + "_"
    end

    return temp
  end

  def validate_date_format(event_date)
    begin
      Date.strptime(event_date,"%Y-%m-%d")
      @event_date = event_date
      # puts "valid date entered"
    rescue
      puts "Invalid date !!!\nEnter date in YYYY-MM-DD"
      exit
    end
  end

  def validate_duplicate_title(title)
    if(@hash_calender[title])
      puts "Event failture , same entry already exists"
      exit
      # puts "Unique title it is"
    end
  end
end

#Taking input date as YYYY-MM-DD
user1 = Calender.new
user1.create_event("Pattern meet","2024-02-4","abc")
user1.create_event("Standup meet","2024-02-3","xyz")
user1.create_event("Sprint meet meet","2024-01-3","xyz")



# user1.create_event("Pattern meet","2024-02-4","abc")

# user1.remove_event("Standup eet")
user1.display_events

#rough works

# x = "Standup meet"
# y = "standup Meet"
# a = y.split
# puts a
# b = ""
# a.each do |item|
#   b = b + item.downcase + "_"
# end
# puts b

# dates = ["2024-02-3","2024-02-3"]
# puts dates.sort_by { |s| Date.strptime(s, '%Y-%m-%d') }

#CUSTOME sort function

# x = {"Pattern"=>{"event_date"=>"2024-09-4","description"=>"xyz"},"Standup"=>{"event_date"=>"2024-12-3","description"=>"abc"}}
# # puts x
#  a= x.sort_by{|k,v|
#   v["event_date"]
# }
# print a
