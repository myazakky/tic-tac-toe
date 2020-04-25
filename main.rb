# frozen_string_literal: true

require_relative './lib/tic_tac_toe'

game = TicTacToe::Game.new
result = game.start
print(result)
