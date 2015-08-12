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

      @saved_locations_current_user = @saved_locations.select do |saved_locations_user_id|
        saved_locations_user_id.user_id == @current_user.id
      end

      @businesses = @saved_locations_current_user.map do |sl|
          Yelp.client.business(sl.business_id)
       end

       @businesses = @businesses.reverse_each

       @trips = Trip.all.order("created_at desc")

       @current_user_trips = @trips.select do |trip|
         trip.user_id == @current_user.id
       end
    end

    # def show_indiv_location
    #   @saved_location = SavedLocation.find(params[:sl_id])
    # end


    # def edit
    #   @trip = Trip.find params[:id]
    #   @saved_location = SavedLocation.find_by(params[:sl])
    # end


     def update
       @trip = Trip.find params[:id]
       @trips = Trip.all
       @saved_location = SavedLocation.find(params[:sl_id])
       @saved_location.trip_id = @trip.id
       @saved_location.save!

       redirect_to saved_locations_path
       @saved_locations = SavedLocation.all

       @current_saved_locations = @current_user.saved_locations


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


  end


# @saved_location = SavedLocation.find_by params[:business_id]
# @saved_location.destroy
# redirect_to saved_locations_path

#  def remove_sl_from_trip
#    @saved_location = SavedLocation.find(params[:sl_id])
#    @saved_location.trip_id == nil
#    redirect_to saved_locations_path
 #
#  end
