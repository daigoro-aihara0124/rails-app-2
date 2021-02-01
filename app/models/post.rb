class Post < ApplicationRecord
  mount_uploader :image, RoomImageUploader

  belongs_to :user
  has_many :reservations

  validates :name, presence: true
  validates :introduction, presence: true
  validates :fee, presence: true
  validates :address, presence: true
  validates :image, presence: true

  def user
    return User.find_by(id: self.user_id)
  end

end
