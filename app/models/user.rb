class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  has_many :drones, dependent: :destroy
  has_many :rentals, dependent: :destroy
  has_attachment :photo
  geocoded_by :full_address
  after_validation :geocode



  def full_address
    "#{address}, #{zip_code}, #{city}"
  end
end
