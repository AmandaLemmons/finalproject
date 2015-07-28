class TripsController < ApplicationController

  def new
    @trip = Trip.new
    @trip = Trip.find_by params[:id]
  end

  def create
    @trip = Trip.new params.require(:trip).permit(:name, :description)
    @trip.user_id = @current_user.id
    @trip.save
    redirect_to saved_locations_path
  end



#
#   def destroy
#     @saved_locations = SavedLocation.all
#     @saved_locations.each do |sl|
#       if sl.business_id == params[:business_id]
#         sl.destroy
#       else
#       end
#     end
#     redirect_to saved_locations_path
#   end
#
# end
end
