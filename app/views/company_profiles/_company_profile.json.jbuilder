json.extract! company_profile, :pic_fullname, :pic_phone_number, :pic_position, :pic_email, :c_name, :c_reg_number, :c_address, :c_city, :c_postcode, :c_state, :c_country, :c_phone_number, :c_website, :c_email, :created_at, :updated_at
json.url company_profiles_url
json.user current_user, :username, :email, :created_at, :updated_at
