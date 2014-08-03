class DashboardController < ApplicationController
  def show
    @players = Player.by_overall_rank
  end
end
