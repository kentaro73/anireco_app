class Post < ApplicationRecord
  validates :title, presence: true
  has_one_attached :image           # active_storage
  belongs_to :user  
end
