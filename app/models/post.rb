class Post < ApplicationRecord
  validates :title, presence: true
  has_one_attached :image           # active_storage
  belongs_to :user  
  default_scope -> { order(created_at: :desc) }
  before_create :default_image
  
  def default_image
    unless self.image.attached?
      self.image.attach(io: File.open(Rails.root.join("app", "assets", "images", "no_image.jpg")), filename: "no_image.jpg", content_type: "image/jpg")
    end
  end
end
