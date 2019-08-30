class ApplicationController < ActionController::Base
  before_action :authenticate_user!


  
  private

  def set_current_user
    User.current = current_user
  end

end
