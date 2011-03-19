class BankAccount < ActiveRecord::Base
  
  belongs_to :user
  validates :user_id, :presence => true
  validates :name, :presence => true

  before_save do
    # Rounds to 2dp and also sets the balance to 0 upon creation
    self.balance = self.balance.to_f.round(2)
  end
  
  def credit(amount)
    self.balance += amount.to_f
  end

  def debit(amount)
    self.balance -= amount.to_f
  end
end
