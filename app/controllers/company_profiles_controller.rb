class CompanyProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company_profile, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @company_profile.update company_profile_params
        format.html { redirect_to company_profiles_path, notice: 'Company profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @company_profile }
      else
        format.html { render :edit }
        format.json { render json: @company_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_company_profile
      @company_profile = current_user.company_profile
    end

    def company_profile_params
      params.require(:company_profile).permit(:user_id, :c_profile_picture, :c_profile_picture_cache, :pic_fullname, :pic_phone_number, :pic_position, :pic_email, :c_name, :c_reg_number, :c_address, :c_city, :c_postcode, :c_state, :c_country, :c_phone_number, :c_website, :c_email)
    end
end
