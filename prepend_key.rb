
module Purchaseble
  def purchase(item)
    puts "#{item} is purchased"
  end
end

class BookStore
  #include Purchaseble    #In this case Purchaseble is second ancestor
  prepend Purchaseble     #Here the ancestors are getting changed
  def purchase(item)
    p "#{item} is purchased from bookstore"
  end
end

bt = BookStore.new
bt.purchase("Macbook")
