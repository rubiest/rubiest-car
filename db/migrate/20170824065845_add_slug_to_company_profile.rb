class AddSlugToCompanyProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :company_profiles, :slug, :string
    add_index :company_profiles, :slug, unique: true
  end
end
