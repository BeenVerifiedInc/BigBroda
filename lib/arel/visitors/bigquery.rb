module Arel
  module Visitors
    class Bigquery < ToSql
      def visit_Arel_Attributes_Attribute o, collector
        puts "Arel::Visitors::Bigquery#visit_Arel_Attributes_Attribute"
        join_name = o.relation.table_alias || o.relation.name
        collector << quote_column_name(o.name)
      end
    end
  end
end
