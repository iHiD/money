module Accounts
  def self.table_name_prefix
    'accounts_'
  end
  
  module Methods
    def self.included(klass)
      klass.has_one :account, :as => :owner
      klass.send(:after_save, :save_account)
    end

    def errors
      super.merge(account.errors)
    end

    def method_missing(name, *args)
      account || build_account
      account.send(name, *args)
    end

    #Account.attributes.each do |attribute|
    %w(user name description balance).each do |attribute|
      define_method(attribute) do
        account || build_account
        account.send(attribute)
      end
      define_method("#{attribute}=") do |val|
        account || build_account
        account.send("#{attribute}=", val)
      end
    end

    protected

    def save_account
      account.save
    end
  end
end
