class CreateBankAccounts < ActiveRecord::Migration
  def self.up

    create_table :bank_accounts do |t|
      t.string :sort_code, :null => false, :default => ""
      t.string :account_number, :null => false, :default => ""
      t.timestamps
    end
  end

  def self.down
    drop_table :bank_accounts
  end
end

