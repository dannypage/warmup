class PlayersController < ApplicationController

  def training_loads
    @player = Player.where(id: params[:player_id])
  end
end