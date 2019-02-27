class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :is_clickbait?

  def is_clickbait?
    if self.title.present? && ["Won't Believe", "Secret", "Top [number]", "Guess"].none? {|item| self.title.include?(item)}
      errors.add(:title, "must be clickbait")
    end
  end

end
