module Arel
  module Visitors
    class Bigquery < ToSql

      def visit_Arel_Nodes_Matches o, collector
        collector << 'REGEXP_CONTAINS('
        collector = visit o.left, collector
        collector << ', '
        collector = visit o.right, collector
        collector << ')'
      end

      # # TODO: implement this. 
      # def visit_Arel_Nodes_DoesNotMatch o, collector
      #   collector = visit o.left, collector
      #   collector << " NOT LIKE "
      #   collector = visit o.right, collector
      #   if o.escape
      #     collector << ' ESCAPE '
      #     visit o.escape, collector
      #   else
      #     collector
      #   end
      # end

      def visit_Arel_Attributes_Attribute o, collector
        join_name = (o.relation.table_alias || o.relation.name).split('.').last
        collector << "`#{join_name}`.#{quote_column_name(o.name)}"
      end
    end
  end
end
