class ActiveRecordTypeBqDateTime < ActiveRecord::Type::DateTime
  private

  def cast_value(string)
    parsed = Time.at(BigDecimal.new(string).to_i).to_s
    super(parsed)
  end
end
