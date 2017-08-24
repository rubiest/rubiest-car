class Car < ApplicationRecord
  belongs_to :company_profile
  belongs_to :brand
  belongs_to :model
end
