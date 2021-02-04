class Reservation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :post

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :num_people, presence: true
  validates :post_id, presence: true
end
