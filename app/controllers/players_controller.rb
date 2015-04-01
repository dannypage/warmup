class PlayersController < ApplicationController

  def training_loads
    @player = Player.find(params['player_id'])
    @chart = @player.chart
  end
end