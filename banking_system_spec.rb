require "rspec"
require_relative "assignment5_banking_system.rb"

RSpec.describe Account do

  context "Account related tests" do
  subject {described_class.new}

  it "Creating a account and initial balance should be 0" do
    expect(subject.balance).to eql(0)
  end

  it "This example validates deposit , withdraw works correctly or not" do
    expect(subject.deposit(100)).to eql("100 Credited to your account")
    expect(subject.withdraw(50)).to be true
    expect(subject.display_balance).to eql("Current Balance of the account 50")
  end
  end
end


RSpec.describe Bank,Account do

  context "Bank related tests" do
    bank1 = Bank.new
    user1 = Account.new
    user2 = Account.new
    not_a_user = 10  #integer class
    it "Creation of the empty account hash where account_no is the primary key in that case" do
      expect(bank1.display_all_accounts).to eql({})
    end

    it "Testing is it adding users into the bank1 hash" do
      expect(bank1.add_account(user1)).to eql("Account added to database succesful")
    end

    it "If the other than account class is try to inserted into the bank1 then it throw error" do
      expect(bank1.add_account(not_a_user)).to eql("Given instance is not belongs to Account class")
    end

    it "Test account is removed successful" do
      expect(bank1.add_account(not_a_user)).to eql("Given instance is not belongs to Account class")
      expect(bank1.remove_account(98000000000)).to eql(true)
    end

    it "Account deletion unsuccsful" do
      expect(bank1.remove_account(23423)).to eql(false)
    end


    it "find a account if found return account class instance" do
      bank1.add_account(user1)
      expect(bank1.find_account(98000000000)).to be_kind_of(Account)
    end
    
  end
end
