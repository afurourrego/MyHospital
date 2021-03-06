class ArlsController < ApplicationController
  before_action :set_arl, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  load_and_authorize_resource

  # GET /arls
  # GET /arls.json
  def index
    @arls = Arl.search(@arls, search_params)
  end

  # GET /arls/1
  # GET /arls/1.json
  def show
  end

  # GET /arls/new
  def new
    @arl = Arl.new
  end

  # GET /arls/1/edit
  def edit
  end

  # POST /arls
  # POST /arls.json
  def create
    @arl = Arl.new(arl_params)

    respond_to do |format|
      if @arl.save
        format.html { redirect_to settings_path, notice: 'ARL was successfully created.' }
        format.json { render :show, status: :created, location: @arl }
      else
        format.html { render :new }
        format.json { render json: @arl.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /arls/1
  # PATCH/PUT /arls/1.json
  def update
    respond_to do |format|
      if @arl.update(arl_params)
        format.html { redirect_to settings_path, notice: 'ARL was successfully updated.' }
        format.json { render :show, status: :ok, location: @arl }
      else
        format.html { render :edit }
        format.json { render json: @arl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /arls/1
  # DELETE /arls/1.json
  def destroy
    @arl.destroy
    respond_to do |format|
      format.html { redirect_to settings_path, notice: 'ARL was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_arl
      @arl = Arl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def arl_params
      params.require(:arl).permit(:name, :active)
    end

    def search_params
      params.permit(:name_arl)
    end
end
