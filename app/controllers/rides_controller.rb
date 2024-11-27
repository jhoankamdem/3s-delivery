class RidesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ride, only: [:show, :edit, :update, :destroy]

  def index
    @rides =Ride.all
  end

  def show
    respond_to do |format| 
      format.html
      format.json {render json: @ride.to_json(include: [:driver, :passenger])}
    end
  end

  def new
    @ride = Ride.new
  end

  def create
    @ride = current_user.passenger.rides.build(ride_params)
    if @ride.save
      redirect_to @ride, notice: 'Ride was successfully created'
    else
      render :new
    end
  end

  def edit 
    respond_to do |format| 
      format.html
      format.json {render json: @ride.to_json(include: [:driver, :passenger])}
    end
  end

  def update
    if @ride.update(ride_params)
      redirect_to @ride, notice: 'Ride was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @ride.destroy 
    redirect_to rides_url, notice: 'Ride was successfully destroyed'
  end

  private

  def set_ride
    @ride = Ride.find(params[:id])
  end

  def ride_params
    params.required(:ride).permit(:pickup_location, :dropoff_location, :status, :price, :driver_id)
  end
end
