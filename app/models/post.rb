class Post < ApplicationRecord
    belongs_to :user
    validates :title, length: { maximum: 150 }
end
