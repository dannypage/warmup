Rails.application.routes.draw do
  root 'dashboard#index'

  get '/players/:player_id/training_loads', to: 'players#training_loads', as: 'player_training_load'
end
