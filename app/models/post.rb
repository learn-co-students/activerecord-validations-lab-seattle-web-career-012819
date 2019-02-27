class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :clickbaity_title

  def clickbaity_title
    baits = ["Won't Believe", "Secret", "Top", "Guess"]
    title_check = baits.map { |b| title.include?(b) }.include?(true) if title

    if !title_check
      errors.add(:title, "Must be clickbait-y.")
    end
  end
end
