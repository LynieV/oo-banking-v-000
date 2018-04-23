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
    if sender.valid? && receiver.valid? && sender.balance > amount
      true
    end
  end
  
  def execute_transaction
    if self.valid? && status = "pending" 
      sender.balance -= amount
      receiver.balance += amount
      status = "complete"
    else
      status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if status = "complete"
      receiver.balance -= amount
      sender.balance += amount
      status = "reversed"
    end
  end
  
end
