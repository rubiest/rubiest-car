class CreateCarProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :car_profiles do |t|
      t.references :car, foreign_key: true
      t.date :road_tax_expired_date

      t.timestamps
    end
  end
end
