class Drone < ApplicationRecord
  belongs_to :user
  has_many :rentals, dependent: :destroy
  has_attachments :photo_footage, maximum: 3
  has_attachment :photo_drone
end
