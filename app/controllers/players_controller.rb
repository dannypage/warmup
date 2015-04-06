class PlayersController < ApplicationController

  def training_loads
    @player = Player.find(params['player_id'])
    @pw_chart = @player.piecewise_chart
    @sore_chart = @player.sore_chart
  end
end