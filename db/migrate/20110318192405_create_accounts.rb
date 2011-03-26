class CreateAccounts < ActiveRecord::Migration
  def self.up

    create_table :accounts do |t|
      t.string :name, :null => false
      t.text :description, :null => false
      t.decimal :balance, :precision => 8, :scale => 2, :null => false
      t.integer :user_id, :null => false
      t.integer :owner_id, :null => false
      t.string :owner_type, :null => false
    end

    execute "ALTER TABLE accounts
             ADD CONSTRAINT fk_user_id
             FOREIGN KEY (user_id) REFERENCES users (id)"

    execute "ALTER TABLE accounts
             ADD CONSTRAINT uk_account_owner
             UNIQUE (owner_id, owner_type)"
  end

  def self.down
    drop_table :accounts
  end
end
