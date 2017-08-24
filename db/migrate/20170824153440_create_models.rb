class CreateModels < ActiveRecord::Migration[5.1]
  def change
    create_table :models do |t|
      t.belongs_to :brand, index: true, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
