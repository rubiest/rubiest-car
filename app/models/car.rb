class Car < ApplicationRecord
  enum status: [:available, :in_use, :not_available, :pending]

  belongs_to :company_profile
  belongs_to :brand
  belongs_to :model
  has_many :accessorizations
  has_many :accessories, through: :accessorizations
  has_one :car_profile, dependent: :destroy

  before_create :build_default_car_profile
  after_create :mark_as_pending

  validates_presence_of :brand, :price_daily, :price_hourly, :price_weekly, :price_monthly

  default_scope -> { order('cars.created_at DESC') }

  def brand_model
    "#{self.brand.name} #{self.model.name}"
  end

  def available?
    self.status == "available"
  end

  def mark_as_pending
    self.update_attribute(:status, "pending")
  end

  private

    def build_default_car_profile
      build_car_profile
      true
    end
end
