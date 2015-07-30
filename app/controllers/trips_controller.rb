class TripsController < ApplicationController

  def new
    @trip = Trip.new
  end


  def create
    @trip = Trip.new params.require(:trip).permit(:name, :description)
    @trip.user_id = @current_user.id
    if @trip.save
      redirect_to saved_locations_path
    else
      redirect_to root_path
    end
  end

  def destroy
    @trip = Trip.find params[:id]
    @trip.destroy
    redirect_to saved_locations_path
  end





end
