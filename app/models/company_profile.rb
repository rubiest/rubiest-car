class CompanyProfile < ApplicationRecord
  extend FriendlyId
  friendly_id :c_name, use: [:slugged, :finders, :history]

  belongs_to :user

  validates :c_postcode, length: {
    maximum: 5,
    too_long: "%{count} characters is the maximum allowed"
  }, numericality: true

  def should_generate_new_friendly_id?
    c_name_changed?
  end
end
