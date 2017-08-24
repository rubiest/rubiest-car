class PagesController < ApplicationController
  def index
    # temporary
    @company_profiles = CompanyProfile.all
  end

  def garage
    @company_profile = CompanyProfile.friendly.find(params[:id])
  end
end
