class UnitsController < ApplicationController
  before_action :set_unit, only: [:show, :edit, :update, :destroy]

  # GET /units
  # GET /units.json
  def index
    @units = Unit.all.paginate(:page => params[:page], :per_page => 5)
  end

  # GET /units/1
  # GET /units/1.json
  def show
    client = Signet::OAuth2::Client.new(client_options)
    client.update!(session[:authorization])
    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client
    # @calendar = service.get_calendar(:primary)
    @calendar_list = service.list_calendar_lists
    @calendar = service.get_calendar(:primary).id

    @list = @calendar_list.items.map do |c|
      [c.summary_override, c.id]
    end

    # @unit_cleanings = Booking.select do |booking|
    #   booking.unit.calendar_id == params[:calendar_id]
    # end
    # render json: @bookings

  rescue Google::Apis::AuthorizationError
    response = client.refresh!
    session[:authorization] = session[:authorization].merge(response)
    retry
  end

  # GET /units/new
  def new
    @unit = Unit.new
    return show
  end

  # GET /units/1/edit
  def edit
  end

  # POST /units
  # POST /units.json
  def create
    @unit = Unit.new(
      name: unit_params[:name],
      calendar_id: unit_params[:calendar_id],
      owner_id: unit_params[:owner_id],
      address: unit_params[:address],
      city: unit_params[:city],
      state: unit_params[:state],
      zip_code: unit_params[:zip_code]
    )

    respond_to do |format|
      if @unit.save
        format.html { redirect_to @unit, notice: 'Unit was successfully created.' }
        format.json { render :show, status: :created, location: @unit }
      else
        format.html { render :new }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /units/1
  # PATCH/PUT /units/1.json
  def update
    respond_to do |format|
      if @unit.update(unit_params)
        format.html { redirect_to @unit, notice: 'Unit was successfully updated.' }
        format.json { render :show, status: :ok, location: @unit }
      else
        format.html { render :edit }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /units/1
  # DELETE /units/1.json
  def destroy
    delete_calendar

    @unit.destroy
    respond_to do |format|
      format.html { redirect_to units_url, notice: 'Unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete_calendar
    @unit = Unit.find(params[:id])

    client = Signet::OAuth2::Client.new(client_options)
    client.update!(session[:authorization])
    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client
    # client = service.get_calendar(@unit.calendar_id)
    # client = service.list_calendar_lists
    service.delete_calendar_list(@unit.calendar_id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit
      @unit = Unit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unit_params
      params.require(:unit).permit(:name, :calendar_id, :address, :city, :state,
         :zip_code, :owner_id, :utf8, :authenticity_token, :commit)
    end
end
