require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, status)
    @sender = sender
    @receiver = receiver
    @amount = 50
    @status = "pending"
  end
  
  def valid?
    if @sender.valid? && @receiver.valid?
      true
    end
  end
  
  def execute_transaction
    if self.valid? 
      binding.pry
      @sender.balance = (@sender.balance - @amount) 
      (@receiver.balance + @amount)
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    
  end
  
end
