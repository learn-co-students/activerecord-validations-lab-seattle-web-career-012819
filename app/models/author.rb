class Author < ActiveRecord::Base
  validates :phone_number, uniqueness: true, length: { is: 10 }
  validates :name, uniqueness: true, presence: true

end
