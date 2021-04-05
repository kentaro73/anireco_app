class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # 認証
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # アソシエーション
  has_many :posts, dependent: :destroy
  has_many :comments
  # Active Storage
  has_one_attached :avatar, dependent: :destroy
  # バリデーション
  validates :name, presence: true, length: { maximum: 30 }
  # 名前が空白の時、Guestという名前にする
  before_validation :set_nameless_name
  # アバター設定がされていない時のアバター
  before_create :default_avatar

  def set_nameless_name
    self.name = "Guest" if name.blank?
  end

  def default_avatar
    unless self.avatar.attached?
      self.avatar.attach(io: File.open(Rails.root.join("app", "assets", "images", "default_icon.png")), filename: "default_icon.png", content_type: "image/png")
    end
  end

  # ゲストログイン機能
  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
