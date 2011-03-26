module ActiveRecord
  module ConnectionAdapters # :nodoc:
    class TableDefinition
      def timestamps(*args)
        options = args.extract_options!
        options[:null] = false unless options[:null]
        column(:created_at, :datetime, options)
        column(:updated_at, :datetime, options)
      end
    end
  end
  class Base
    def self.is_an_account
      include ::Accounts::Methods
    end
    def self.is_a_transaction
      include ::Transactions::Methods
    end
  end
end