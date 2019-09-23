class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_user

  load_and_authorize_resource


  def index
    @users = User.search(@users, user_params_search)#.page(params[:page])
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated."}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_path, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :role, :level, :name, :phone)
  end

  def user_params_search
    params.permit(:email)
  end
end
