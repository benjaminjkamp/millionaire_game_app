# This file requires the appropriate files and calls the correct runner code from your controller to start your game.

require_relative './controllers/game_controller.rb'

system 'clear'
GameController.new.run