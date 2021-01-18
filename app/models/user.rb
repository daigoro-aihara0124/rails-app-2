class User < ApplicationRecord
  has_secure_password
  VALID_PASSWORD_REGEX = /\A[\w\-]+\z/
  validates :password, presence: true,
                       length: { minimum: 8 },
                       format: {
                         with: VALID_PASSWORD_REGEX
                       },
                       allow_blank: true
  mount_uploader :image_name, ImageUploader
end
