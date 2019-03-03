class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :has_bait?

  BAIT = [
    /Won't Believe/,
    /Secret/,
    /Top [0-9]*/,
    /Guess/
  ]

  def has_bait?
    # Can not use symbols inside of block
    if BAIT.none? { |b| b.match title }
      errors.add(:title, "must be clickbait")
    end
  end
end
