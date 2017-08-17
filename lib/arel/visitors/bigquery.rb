module Arel
  module Visitors
    class Bigquery < ToSql
      def visit_Arel_Attributes_Attribute o, collector
        join_name = o.relation.table_alias || o.relation.name
        collector << "#{join_name}.#{quote_column_name(o.name)}"
      end
    end
  end
end
