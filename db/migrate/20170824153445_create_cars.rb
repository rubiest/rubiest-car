class CreateCars < ActiveRecord::Migration[5.1]
  def change
    create_table :cars do |t|
      t.belongs_to :company_profile, index: true, foreign_key: true
      t.belongs_to :brand, index: true, foreign_key: true
      t.belongs_to :model, index: true, foreign_key: true
      t.decimal :price_hourly, :precision => 8, :scale => 2
      t.decimal :price_daily, :precision => 8, :scale => 2
      t.decimal :price_weekly, :precision => 8, :scale => 2
      t.decimal :price_monthly, :precision => 8, :scale => 2
      t.integer :status, null: false, default: 0
      t.text :note

      t.timestamps
    end
  end
end
