class AddFieldToCarProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :car_profiles, :plate_number, :string
    add_column :car_profiles, :chasis_number, :string
    add_column :car_profiles, :last_service, :date
  end
end
