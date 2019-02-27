class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 50 }
    validates :summary, length: {maximum: 200}
    validate :clickbait?

    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

    def clickbait?
        if self.title
        if self.title.include?("Won't Believe") |self.title.include?("Secret") || self.title.include?("Top") || self.title.include?("Guess")
            return true
        else errors.add(:title, "must be clickbait")
        end
        end
    end

end