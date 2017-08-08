require_relative 'active_record_type_bq_date_time'

class ActiveRecordValueFactory
  def self.new_from_string(string)
    case string.to_s.upcase
    when 'INTEGER'
      ActiveRecord::Type::Integer.new
    when 'STRING'
      ActiveRecord::Type::String.new
    when 'FLOAT'
      ActiveRecord::Type::Float.new
    when 'TIMESTAMP'
      # ActiveRecord::Type::DateTime.new
      ActiveRecordTypeBqDateTime.new
    # when 'RECORD'
    when 'BOOLEAN'
      ActiveRecord::Type::Boolean.new
    else
      raise "unknown column type #{string}"
    end
  end
end
