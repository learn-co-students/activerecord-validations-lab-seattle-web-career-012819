class TitleValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.includes(/Won't Believe/i  /Secret/i  /Top [0-9]*/i |/Guess/i)
      record.errors[attribute] << (options[:message] || "must be clickbait")
    end
  end
end
