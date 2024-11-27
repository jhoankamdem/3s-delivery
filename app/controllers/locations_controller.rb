class LocationsController < ApplicationController
  before_action :authenticate_user!


  def update
    if current_user.drive
      current_user.driver.update(location_params)
    elsif current_user.passenger
      current_user.passenger.update(location_params)
    end

    head :ok
  end

  private 
  def location_params
    params.required(:location).permit(:latitude, :longitude)
  end
end
