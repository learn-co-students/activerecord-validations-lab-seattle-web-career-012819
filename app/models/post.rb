class Post < ActiveRecord::Base
   validates :title, presence: true
   validates :content, length: { minimum: 250 }
   validates :summary, length: { maximum: 250 }
   validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
   validate :is_clickbait?
 
   CLICKBAIT_PATTERNS = [
     /Won't Believe/i,
     /Secret/i,
     /Top [0-9]*/i,
     /Guess/i
   ]
 
   def is_clickbait?
     if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
       errors.add(:title, "must be clickbait")
     end
   end
 end




# require 'pry'


# class Post < ActiveRecord::Base
#    validates :title, presence: true 
#    validates :content, length: {minimum: 250}
#    validates :summary, length: {maximum: 250}
#    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
#    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
#    validates :clickbait_title

#    # def Self.create_clickbait_array 
#    #    keywords = ["Won't Believe", "Secret", "Guess"]
#    #    i = 0
#    #    while i < 100
#    #       keywords << "Top #{i}"
#    #       i += 1
#    #    end 
#    # end 
   
#    # def clickbait_title 
#    # keywords = Post.create_clickbait_array
#    # keywords.none? {|phrase| phrase.match title}
#    #    #    errors.add(:title, "must be clickbait")
#    #    # end 
#    # end


# end

