class CompanyProfile < ApplicationRecord
  extend FriendlyId
  friendly_id :c_name, use: [:slugged, :finders, :history]

  belongs_to :user

  validates :c_name, presence: true, uniqueness: true, on: :update
  validates :c_reg_number, presence: true, uniqueness: true, on: :update
  validates :c_postcode, length: {
    maximum: 5,
    too_long: "%{count} characters is the maximum allowed"
  }, numericality: true, on: :update

  def should_generate_new_friendly_id?
    c_name_changed?
  end
end
