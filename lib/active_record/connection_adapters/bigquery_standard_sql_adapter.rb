require_relative 'rails_42'

module ActiveRecord
  module ConnectionAdapters
    class BigqueryAdapter

      def quote_column_name(name) #:nodoc:
        name
      end

      def quote_table_name(name)
        "#{@config[:database]}.#{name}"
      end

    end
  end
end
