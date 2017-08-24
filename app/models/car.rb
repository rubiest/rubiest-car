class Car < ApplicationRecord
  enum status: [:available, :in_use, :not_available]

  belongs_to :company_profile
  belongs_to :brand
  belongs_to :model
  has_many :accessorizations
  has_many :accessories, through: :accessorizations
  has_one :car_profile, dependent: :destroy

  before_create :build_default_car_profile

  default_scope -> { order('cars.created_at DESC') }

  def brand_model
    "#{self.brand.name} #{self.model.name}"
  end

  private

    def build_default_car_profile
      build_car_profile
      true
    end
end
