class AddProfilePictureToCompanyProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :company_profiles, :c_profile_picture, :string
  end
end
