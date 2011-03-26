class Account < ActiveRecord::Base
  
  belongs_to :owner, :polymorphic => true
  belongs_to :user
  
  has_many :transactions
  
  validates :user_id, :presence => true, :numericality => {:greater_than => 0}
  validates :name, :presence => true
  validates :description, :presence => true
  validates :owner, :presence => true
  
  before_save do
    # Rounds to 2dp and also sets the balance to 0 upon creation
    self.balance = self.balance.to_f.round(2)
  end

  def credit(amount)
    self.balance ||= 0
    self.balance += amount.to_f
  end

  def debit(amount)
    self.balance ||= 0
    self.balance -= amount.to_f
  end
  
  def balance=(val)
    super(val)
  end
end
