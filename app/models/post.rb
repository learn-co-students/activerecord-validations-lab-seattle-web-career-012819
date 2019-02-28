require 'pry'
class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Non-Fiction", "Fiction"] }
  validate :clickbait
  
  def clickbait
    unless self.title.nil?
      found =["Won't Believe", "Secret", "Top", "Guess"].find do |bait|
        self.title.include?(bait)
      end
      # binding.pry
      if found.nil?
        errors.add(:title, "Title must be clickbaity")
      end
    else
      false
    end
  end
end
