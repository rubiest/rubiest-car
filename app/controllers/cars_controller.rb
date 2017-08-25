class CarsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company_profile, only: [:index, :new, :create]
  before_action :set_car, only: [:edit, :update]
  before_action :set_car_profile, only: [:show]

  def index
    @cars = Car.where(company_profile: @company_profile)
  end

  def new
    @car ||= Car.new
    render
  end

  def create
    @car = @company_profile.cars.new(car_params)
    if @car.save
      redirect_to cars_path, notice: "Your car has been added"
    else
      render 'new', error: 'Something went wrong, please try again.'
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @car.update car_params
        format.html { redirect_to car_path(@car), notice: 'Car was successfully updated.' }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @car.destroy
      redirect_to cars_path, notice: 'Car has been deleted!'
    else
      render 'index'
    end
  end

  private

    def set_car
      @car = Car.find params[:id]
    end

    def set_company_profile
      @company_profile = CompanyProfile.find_by_user_id current_user
    end

    def set_car_profile
      @company_profile = CompanyProfile.find_by_user_id current_user
      @car = @company_profile.cars.find params[:id]
      @car_profile = @car.car_profile
      rescue ActiveRecord::RecordNotFound
        redirect_to(cars_url, :notice => 'Record not found')
    end

    def car_params
      params.require(:car).permit(:company_profile_id, :brand_id, :model_id, :price_hourly, :price_daily, :price_weekly, :price_monthly, accessory_ids: [])
    end
end
