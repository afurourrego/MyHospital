class SettingsController < ApplicationController
  def index
    @eps = Ep.all
    @arls = Arl.all
  end
end
