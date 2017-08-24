class Accessory < ApplicationRecord
  has_many :accessorizations
  has_many :cars, through: :accessorizations
end
