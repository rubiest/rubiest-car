class Brand < ApplicationRecord
  has_many :cars
  has_many :models
end
