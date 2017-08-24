class CreateCompanyProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :company_profiles do |t|
      t.belongs_to :user, foreign_key: true
      t.string :pic_fullname
      t.string :pic_phone_number
      t.string :pic_position
      t.string :pic_email
      t.string :c_name
      t.string :c_reg_number
      t.text :c_address
      t.string :c_city
      t.string :c_postcode
      t.string :c_state
      t.string :c_country
      t.string :c_phone_number
      t.string :c_website
      t.string :c_email

      t.timestamps
    end
    add_index :company_profiles, :c_name, unique: true
    add_index :company_profiles, :c_reg_number, unique: true
  end
end
