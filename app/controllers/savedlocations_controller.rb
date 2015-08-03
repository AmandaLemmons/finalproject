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

     @trips = Trip.all.order("created_at desc")

     @current_user_trips = @trips.select do |trip|
       trip.user_id == @current_user.id
     end
  end

  # def edit
  #   @saved_location = SavedLocation.find_by(params[:business_id])
  #   @trip = Trip.find params[:id]
  # end
  #
  # def update
  #   @trip = Trip.find params[:id]
  #   @x = SavedLocation.find_by(params[:sl])
  #   @x.trip_id = @trip.id
  #   @x.save

    # @saved_location.trip_id = @trip.id
    # @saved_location.save!
    #
    # @saved_locations = SavedLocation.all
    #  @saved_location = @saved_locations.select do |sl|
    #   (sl.trip_id == @trip.id)

    #  end
  #   @saved_location = SavedLocation.find_by(params[:business_id])
  #   @trip = Trip.find(params[:id])

    # @saved_location.self

    # @saved_location.update_attributes({:trip_id => @trip.id})

    # @trip.id = (params[:id])
    # @saved_location.trip_id = @trip.id
    # @saved_location.user_id = @current_user.id
    # @saved_location.save

    # @saved_locations = SavedLocation.all
    #
    # @x = @saved_locations.select do |x|
    #   x.user_id == @current_user.id
    # end
    # end



    # @current_user_saved_locations = @saved_locations.select do |sl|
    #   sl.user_id == @current_user.id
      # sl.trip_id == @trip.id
    # end


    def add_location
      @trip = Trip.find params[:id]
      @saved_location = SavedLocation.find_by(params[:sl])

      # @saved_loaction = @saved_location.update_attribute(:trip_id, @trip.id)
      #  @saved_location = @saved_location.update(trip_id: @trip.id)



      @saved_location.trip_id = @trip.id
      @saved_location.save!

      redirect_to root_path

      #
      # @saved_locations = SavedLocation.all
      #  @saved_location = @saved_locations.select do |sl|
      #   (sl.trip_id == @trip.id)
      #
      #  end


      # @trip = Trip.find params[:id]
      #
      # @saved_location = SavedLocation.find_by(params[:sl_id])

      # @saved_location = @saved_locations.select do |sl|
      #   sl.user_id == @current_user.id
      #
      # end


      # @saved_location.update_attributes({:trip_id => @trip.id})

    end

    def change
      @trip = Trip.find params[:id]
      @trip = @trip.id
      @saved_location = SavedLocation.find_by(params[:sl])

      @saved_location.trip_id = @trip
      @saved_location.save!

      @saved_locations = SavedLocation.all

      @saved_location = @saved_locations.select do |sl|
      sl.trip_id == @trip
    end

      # respond_to do |format|
      #   format.html {redirect_to saved_locations_path, notice: "UPdated"}
      # end

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
