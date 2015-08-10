class TripsController < ApplicationController

  def new
    @trip = Trip.new
  end


  def create
    @trip = Trip.new params.require(:trip).permit(:name, :description)
    @trip.user_id = @current_user.id
    @trip.save

    redirect_to saved_locations_path
  end

  def add_location
    @saved_locations = SavedLocation.all
    @trip = Trip.all

    @saved_location = @saved_locations.select do |sl|
      sl.user_id == @current_user.id
    end

    @saved_location.update_attributes({:trip_id => @trip.id})

  end

  def destroy
    @trip = Trip.find params[:id]
    @trip.destroy
    redirect_to saved_locations_path
  end





end
