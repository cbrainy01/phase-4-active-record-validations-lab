class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
    validate :clickbait?

    def clickbait?
       if [/won't believe/i, /secret/i, /top \d/i, /guess/i].none? { |bait| bait.match title }
        errors.add(:title, "too much integrity in this title")
        end
    end

end
