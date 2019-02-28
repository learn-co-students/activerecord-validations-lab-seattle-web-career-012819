class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}

  validate :clickbaity

  private

  def clickbaity
    clickbait = ["Won't Believe", "Secret", "Top [number]","Guess"]
    if self.title
      clickbait.each do |phrase|
        if (self.title).include? phrase
          return true
        end
      end
    end
    return false
  end
end
