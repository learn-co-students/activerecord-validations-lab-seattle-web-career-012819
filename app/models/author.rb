class Author < ActiveRecord::Base
  # validates :name, length: { minimum: 2 }
  # validates :bio, length: { maximum: 500 }
  # validates :password, length: { in: 6..20 }
  # validates :registration_number, length: { is: 6 }

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :phone_number, length: { is: 10}

end
