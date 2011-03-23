# Contains generic code for bank accounts, credit cards, loans etc.
module TransactionHandler

  # This is called when the module is included in a class.
  # e.g. 
  #   class BankAccount
  #     include TransactionHandler
  #   end
  #
  # is the same as
  #   class BankAccount
  #     before_send do
  #        ...
  #     end
  #   end
  def self.included(base)
    base.send :before_save do
      # Rounds to 2dp and also sets the balance to 0 upon creation
      self.balance = self.balance.to_f.round(2)
    end
  end
  
  def credit(amount)
    self.balance += amount.to_f
  end

  def debit(amount)
    self.balance -= amount.to_f
  end
  
end