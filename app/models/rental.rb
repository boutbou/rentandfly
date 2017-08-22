class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :drone
  before_validation :totalprice

  def totalprice
    self.total_price = ((end_date - start_date) * drone.daily_price)
  end
end
