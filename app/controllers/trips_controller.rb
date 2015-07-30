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


    def show
      @trip = Trip.find params[:id]
      @trips = Trip.all
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
