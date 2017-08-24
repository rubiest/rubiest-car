class CarProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_car_profile, only: [:show, :edit, :update]
  before_action :set_car, only: [:edit, :update]

  def show
  end

  def edit
    # byebug
  end

  def update
    # byebug
    respond_to do |format|
      if @car_profile.update car_profile_params
        format.html { redirect_to car_car_profiles_path(@car_profile.car_id), notice: 'Car profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @car_profile.car_id }
      else
        format.html { render :edit }
        format.json { render json: @car_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_car
      @car = Car.find params[:car_id]
    end


    def set_car_profile
      @car_profile = CarProfile.find_by_car_id params[:car_id]
    end

    def car_profile_params
      params.require(:car_profile).permit(:car_id, :road_tax_expired_date)
    end
end
