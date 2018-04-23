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
    if sender.valid? && receiver.valid? 
      true
    end
  end
  
  def execute_transaction
    if valid? && self.status == "pending" && sender.balance > amount
      binding.pry
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if self.status = "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    end
  end
  
end
