class Post < ApplicationRecord
  belongs_to :user, optional: true
  mount_uploader :image, RoomImageUploader
end
