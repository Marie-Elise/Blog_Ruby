class Comment < ApplicationRecord
    belongs_to :user, required: false
    belongs_to :post, required: false
  end