class CarProfile < ApplicationRecord
  belongs_to :car

  validates_presence_of :road_tax_expired_date, :plate_number, :chasis_number, :last_service, on: :update

  after_update :mark_as_available

  def mark_as_available
    self.car.update_attribute(:status, "available")
  end
end
