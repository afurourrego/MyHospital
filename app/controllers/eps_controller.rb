class EpsController < ApplicationController
  before_action :set_ep, only: [:show, :edit, :update, :destroy]

  # GET /eps
  # GET /eps.json
  def index
    @eps = Ep.all
  end

  # GET /eps/1
  # GET /eps/1.json
  def show
  end

  # GET /eps/new
  def new
    @ep = Ep.new
  end

  # GET /eps/1/edit
  def edit
  end

  # POST /eps
  # POST /eps.json
  def create
    @ep = Ep.new(ep_params)

    respond_to do |format|
      if @ep.save
        format.html { redirect_to @ep, notice: 'Ep was successfully created.' }
        format.json { render :show, status: :created, location: @ep }
      else
        format.html { render :new }
        format.json { render json: @ep.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eps/1
  # PATCH/PUT /eps/1.json
  def update
    respond_to do |format|
      if @ep.update(ep_params)
        format.html { redirect_to @ep, notice: 'Ep was successfully updated.' }
        format.json { render :show, status: :ok, location: @ep }
      else
        format.html { render :edit }
        format.json { render json: @ep.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eps/1
  # DELETE /eps/1.json
  def destroy
    @ep.destroy
    respond_to do |format|
      format.html { redirect_to eps_url, notice: 'Ep was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ep
      @ep = Ep.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ep_params
      params.require(:ep).permit(:name, :active)
    end
end
