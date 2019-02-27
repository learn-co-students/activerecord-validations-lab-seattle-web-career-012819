class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ['Fiction', 'Non-Fiction']}
  validate :is_clickbait?

  REGEX = [/Won't Believe/,/Secret/, /Top [0-9]*/,/Guess/i
  ]

  def is_clickbait?
    if REGEX.none? { |word| word.match title }
      errors.add(:title, "Nope, not clickbaity enough")
    end
  end
end
