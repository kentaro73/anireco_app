class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_one_attached :avatar, dependent: :destroy
  validates :name, presence: true, length: { maximum: 30 }
  before_validation :set_nameless_name
  before_create :default_avatar

  def set_nameless_name
    self.name = "Guest" if name.blank?
  end

  def default_avatar
    unless self.avatar.attached?
      self.avatar.attach(io: File.open(Rails.root.join("app", "assets", "images", "default_icon.png")), filename: "default_icon.png", content_type: "image/png")
    end
  end

  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
