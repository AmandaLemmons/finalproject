class SavedlocationsController < ApplicationController

  def create
    @saved_location = SavedLocation.new
    @saved_location.business_id = params[:business_id]
    @saved_location.user_id = @current_user.id
    @saved_location.save
    redirect_to saved_locations_path
  end

  def show


    @saved_locations = SavedLocation.all

    @saved_locations_user_ids = @saved_locations.select do |saved_locations_user_id|
      saved_locations_user_id.user_id == @current_user.id
    end

    @businesses = @saved_locations_user_ids.map do |sl|
     Yelp.client.business(sl.business_id)
     end
     @businesses = @businesses.reverse_each
  end

  def destroy
    @saved_locations = SavedLocation.all
    @saved_locations.each do |sl|
      if sl.business_id == params[:business_id]
        sl.destroy
      else
      end
    end
    redirect_to saved_locations_path
  end

  # def new_trip
  #   @trip = Trip.new
  #   @trip = Trip.find_by params[:id]
  # end

  # def create_trip
  #     @trip = Trip.new params.require(:trip).permit(:name, :description)
  #     @trip.user_id = @current_user.id
  #     @trip.save
  #     redirect_to saved_locations_path
  # end

end
