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

    @saved_location = SavedLocation.new
    @saved_locations = SavedLocation.all

    @saved_locations_user_ids = @saved_locations.select do |saved_locations_user_id|
      saved_locations_user_id.user_id == @current_user.id
    end

    @businesses = @saved_locations_user_ids.map do |sl|
     Yelp.client.business(sl.business_id)
     end
     @businesses = @businesses.reverse_each

     @trips = Trip.all
     
     @trip = @trips.select do |trip|
       trip.user_id == @current_user.id
     end


  end

  def destroy
    @trip = Trip.find params[:id]
    @trip.destroy
    redirect_to saved_locations_path
  end





end
