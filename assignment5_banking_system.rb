
module AccountRelatedJobs

  def check_valid_account?(accounts ,account_no)
    if accounts[account_no] == nil
      puts "Invalid account #{account_no} !!"
      return false
    end
    return accounts[account_no]
  end

end



#Task1
class Account
  @@account_numbers = 98000000000

  attr_reader :balance , :account_number
  def initialize
    @account_number = @@account_numbers
    @@account_numbers += 1
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
    puts "#{amount} Credited to your account"
  end

  def withdraw(amount)
    if @balance - amount < 0
      puts "Insufficient balance you can't withdraw #{amount}"
      return
    end
    @balance -= amount
    puts "#{amount} debited from your account"
  end

  def display_balance
    puts "Current Balance of the account #{@balance}"
  end


end

user1 = Account.new
user1.deposit(1200)
# user1.withdraw(120)
# user1.display_balance

user2 = Account.new
user2.deposit(1500)
# user1.withdraw(120)
# user2.display_balance

#Task2
class Bank
  include AccountRelatedJobs
  def initialize
    @@accounts = {}
  end

  def add_account(account)
    if account.class.to_s == "Account"
      @@accounts.store(account.account_number,account)
      puts "Account added to database succesful"
    else
      puts "Given instance is not belongs to Account class"
    end
  end

  def remove_account(account_no)
    check_valid_account?(@@accounts,account_no)?@@accounts.delete(account_no):""
  end

  def display_all_accounts
    @@accounts.each do |accountkey,account|
      print "Account number : #{account.account_number}
Balance : #{account.balance}
      \n"
    end
  end

  def find_account(account_no)
    return check_valid_account?(@@accounts,account_no)
  end
end


bank1 = Bank.new
bank1.add_account(user1)
bank1.add_account(user2)
bank1.remove_account(98000000001)
bank1.display_all_accounts

temp = bank1.find_account(98000000000)
