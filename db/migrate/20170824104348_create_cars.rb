class CreateCars < ActiveRecord::Migration[5.1]
  def change
    create_table :cars do |t|
      t.belongs_to :company_profile, index: true, foreign_key: true
      t.string :brand
      t.string :model
      t.decimal :price_hourly, :precision => 8, :scale => 2
      t.decimal :price_daily, :precision => 8, :scale => 2
      t.decimal :price_weekly, :precision => 8, :scale => 2
      t.decimal :price_monthly, :precision => 8, :scale => 2
      t.integer :status
      t.text :note

      t.timestamps
    end
  end
end
