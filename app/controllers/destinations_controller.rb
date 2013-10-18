class DestinationsController < ApplicationController
  before_action :set_destination, only: [:show, :edit, :update, :destroy]

  # GET /destinations
  # GET /destinations.json
  def index
    @destinations = Destination.all
  end

  # GET /destinations/1
  # GET /destinations/1.json
  def show
    @trip = Trip.find(params[:trip_id])
    @destination = Destination.find(params[:id])
  end

  # GET /destinations/new
  def new
    @trip = Trip.find(params[:trip_id])
    @destination = Destination.new
  end

  # GET /destinations/1/edit
  def edit
    @trip = Trip.find(params[:trip_id])
    @destination = Destination.find(params[:id])
  end

  # POST /destinations
  # POST /destinations.json
  def create
    @trip = Trip.find(params[:trip_id])
    @destination = @trip.destinations.new(params[:destination])

    respond_to do |format|
      if @destination.save
        format.html { redirect_to trip_destination_path(@trip, @destination), notice: 'Destination was successfully created.' }
        format.json { render action: 'show', status: :created, location: @destination }
      else
        format.html { render action: 'new' }
        format.json { render json: @destination.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /destinations/1
  # PATCH/PUT /destinations/1.json
  def update
    @destination = Destination.find(params[:id])

    respond_to do |format|
      if @destination.update(destination_params)
        format.html { redirect_to trip_destination_path(@destination.trip, @destination), notice: 'Destination was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @destination.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /destinations/1
  # DELETE /destinations/1.json
  def destroy
    @destination.destroy
    respond_to do |format|
      format.html { redirect_to destinations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_destination
      @destination = Destination.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def destination_params
      params.require(:destination).permit(:name, :description)
    end
end
