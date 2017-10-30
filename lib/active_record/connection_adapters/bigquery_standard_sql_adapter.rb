require_relative 'rails_42'

module ActiveRecord
  module ConnectionAdapters
    class BigqueryAdapter

      def quote_column_name(name) #:nodoc:
        name
      end

      def quote_table_name(name)
        name.split('.').map { |s| "`#{s}`" }.join('.')
      end

    end
  end
end
