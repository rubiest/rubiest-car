class CompanyProfile < ApplicationRecord
  extend FriendlyId
  friendly_id :c_name, use: [:slugged, :finders, :history]

  belongs_to :user

  default_scope -> { order('company_profiles.created_at DESC') }

  validates :c_name, presence: true, uniqueness: true, on: :update
  validates :c_reg_number, uniqueness: true, on: :update
  validates_presence_of :c_reg_number, message: 'can\'t be blank!'
  validates :c_postcode, length: {
    maximum: 5,
    too_long: "%{count} characters is the maximum allowed"
  }, numericality: true, on: :update

  def should_generate_new_friendly_id?
    c_name_changed?
  end

  def location
    "#{self.c_city}, #{self.c_state}"
  end

  # change the field error name : https://stackoverflow.com/questions/5785503/change-error-field-name-in-rails
  # START
  HUMANIZED_ATTRIBUTES = {
    :c_reg_number => "Company Registration Number"
  }

  def self.human_attribute_name(attr, options = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end
  # END
end
