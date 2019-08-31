class UsersController < ApplicationController
  before_action :authenticate_user!

  load_and_authorize_resource

  before_action :set_current_user

  def index
    @users = User.search(@users, user_params_search)#.page(params[:page])
    @permited_roles = current_user.permited_role
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html { redirect_to @user, notice: t("share.success_update", class_name: t("users.user_title"))}
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
      format.html { redirect_to users_path }
      format.json { head :no_content }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :role, :level)
  end

  def user_params_search
    params.permit(:email)
  end
end