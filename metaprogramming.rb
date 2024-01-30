# https://www.shakacode.com/blog/metaprogramming-in-ruby/


class Account

  def get_acc_no
    p "984932849"
  end

  def get_name
    p "xyz"
  end

  def get_credit
    p "3433"
  end

  private

  def this_is_confidential
    p "This is Joint account"
  end
end

cust1 = Account.new
cust1.send("get_name")
cust1.send("this_is_confidential")
#Use of send method we can call private methods also so it's developers responsibility to how to use it
# cust1.public_send("this_is_confidential")
#Unable to access this method as we are using public_send method


# use the metaprogramming function provided by Ruby, define_method.
# Using the define_method, you can create all the functions dynamically

class CreateStatus
  STATUSES = ["initiated", "dispatched", "in_transit", "out_for_delivery", "delivered", "cancelled"].freeze
  STATUSES.each do |status|
    define_method("is_#{status}?") do
      self.status == status
    end
  end
end

# Monkey patching the String class
class String
  def reverse_and_upcase
    self.reverse.upcase
  end
end

# Using the monkey patched method
puts "Hello, World!".reverse_and_upcase
