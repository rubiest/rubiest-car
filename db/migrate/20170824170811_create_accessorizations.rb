class CreateAccessorizations < ActiveRecord::Migration[5.1]
  def change
    create_table :accessorizations do |t|
      t.references :car, foreign_key: true
      t.references :accessory, foreign_key: true

      t.timestamps
    end
  end
end
