class RsvpsController < ApplicationController
  #before_action :set_rsvp, only: [:show, :edit, :update, :destroy]

  def index
    redirect_to enter_code_path
  end

  def enter_code
    @rsvp = Rsvp.new
  end

  def create
    confirmation_code = params['rsvp']['confirmation_code'];
     @rsvp = Rsvp.where({confirmation_code: confirmation_code}).first

    respond_to do |format|
      if @rsvp
        format.html { redirect_to rsvp_update_rsvp_url(@rsvp.confirmation_code), notice: 'Please enter your rsvp code wedding.' }
        format.json { render :index, status: :created, location: @rsvp }
      else
        format.html { redirect_to enter_code_path, error: 'Could not find rsvp with that code!'  }
        format.json { render json: @rsvp.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_rsvp
      @rsvp = Rsvp.where({confirmation_code: params[:rsvp_id]}).first
  end

  def update
      @rsvp = Rsvp.find(params[:id])

      @rsvp.has_responded = true

    respond_to do |format|
      if @rsvp.update(rsvp_params)
        if @rsvp.can_attend 
          format.html { redirect_to can_attend_path, notice: 'Successfully rsvped' }
          format.json { render :index, status: :created, location: @rsvp }
        else
          format.html { redirect_to cannot_attend_path, notice: 'Successfully rsvped' }
          format.json { render :index, status: :created, location: @rsvp }
        end
      else
        format.html { redirect_to enter_code_path, error: 'Could not find rsvp with that code!'  }
        format.json { render json: @rsvp.errors, status: :unprocessable_entity }
      end
    end
  end


  # # GET /rsvps/1
  # # GET /rsvps/1.json
  # def show
  # end

  # # GET /rsvps/new
  # def new
  #   @rsvp = Rsvp.new
  # end

  # # GET /rsvps/1/edit
  # def edit
  # end

  # # POST /rsvps
  # # POST /rsvps.json
  # def create
  #   @rsvp = Rsvp.new(rsvp_params)

  #   respond_to do |format|
  #     if @rsvp.save
  #       format.html { redirect_to @rsvp, notice: 'Rsvp was successfully created.' }
  #       format.json { render :show, status: :created, location: @rsvp }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @rsvp.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /rsvps/1
  # # PATCH/PUT /rsvps/1.json
  # def update
  #   respond_to do |format|
  #     if @rsvp.update(rsvp_params)
  #       format.html { redirect_to @rsvp, notice: 'Rsvp was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @rsvp }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @rsvp.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /rsvps/1
  # # DELETE /rsvps/1.json
  # def destroy
  #   @rsvp.destroy
  #   respond_to do |format|
  #     format.html { redirect_to rsvps_url, notice: 'Rsvp was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rsvp
      @rsvp = Rsvp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rsvp_params
      params.require(:rsvp).permit(:name, :confirmation_code, :can_attend, :num_attending, :messages)
    end
end
