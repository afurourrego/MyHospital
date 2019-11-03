class HistoryController < ApplicationController
  before_action :authenticate_user!

  def index
    @histories = Profile.all.search_history(Profile.all, search_params)
  end


  private

    def search_params
      params.permit(:identification_card, :from_date, :to_date)
    end
end
