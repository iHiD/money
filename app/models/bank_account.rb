class BankAccount < ActiveRecord::Base
  
  include TransactionHandler
  
  belongs_to :user
  validates :user, :presence => true
  validates :user_id, :presence => true
  validates :name, :presence => true
  validates :description, :presence => true
  
end
