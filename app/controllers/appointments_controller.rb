class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: [:show, :edit, :update, :destroy, :check_assistance, :diagnostic, :diagnostic_send]

  load_and_authorize_resource

  # GET /appointments
  # GET /appointments.json
  def index
    @appointments = Appointment.search(@appointments, search_params)
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def check_assistance
    if @appointment.update_attributes(assistance: true)
      respond_to do |format|
        format.html { redirect_to appointments_url, notice: 'Check assistance was successfully registered.' }
        format.json { head :no_content }
      end
    end
  end

  def diagnostic
  end

  def diagnostic_send
    respond_to do |format|
      if @appointment.update_attributes(diagnostic_params)
        format.html { redirect_to @appointment, notice: 'Diagnostic was successfully registered.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :diagnostic }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      params[:id] ||= params[:appointment_id]
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:date, :date_date, :date_time, :doctor_id, :patient_id, :diagnostic, :assistance)
    end

    def search_params
      params.permit(:date, :doctor_id, :patient_id)
    end

    def diagnostic_params
      params.require(:appointment).permit(:diagnostic)
    end
end
