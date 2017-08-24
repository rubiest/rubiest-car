class CarsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company_profile, only: [:index, :new, :create]

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
    #code
  end

  def edit
    #code
  end

  def update
    #code
  end

  def destroy
    #code
  end

  private

    def set_company_profile
      @company_profile = CompanyProfile.find_by_user_id current_user
    end

    def car_params
      params.require(:car).permit(:company_profile_id, :brand, :model, :price_hourly, :price_daily, :price_weekly, :price_monthly)
    end
end
