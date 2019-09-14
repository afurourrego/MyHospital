class SettingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @arls = Arl.all
    @eps = Ep.all

    @arls = @arls.search(@arls, search_params)
    @eps = @eps.search(@eps, search_params)
  end

  private

    def search_params
      params.permit(:name_arl, :name_eps)
    end
end
