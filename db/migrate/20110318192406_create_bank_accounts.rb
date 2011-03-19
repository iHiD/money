class CreateBankAccounts < ActiveRecord::Migration
  def self.up
    create_table :bank_accounts do |t|
      t.string :name, :null => false
      t.decimal :balance, :precision => 8, :scale => 2, :null => false
      t.integer :user_id, :null => false
      t.timestamps
    end
    
    execute "ALTER TABLE bank_accounts
             ADD CONSTRAINT fk_user_id
             FOREIGN KEY (user_id) REFERENCES users (id)"
  end

  def self.down
    drop_table :bank_accounts
  end
end
