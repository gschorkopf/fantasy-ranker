class DashboardController < ApplicationController
  def show
    @players = PlayerDecorator.decorate_collection(Player.by_overall_rank)
    @positions = Player::POSITIONS
  end
end
