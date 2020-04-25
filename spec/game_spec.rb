# frozen_string_literal: true

require 'rspec'
require_relative '../lib/tic_tac_toe'

RSpec.describe TicTacToe::Game do
  subject { TicTacToe::Game.new }

  describe 'illegal_operation?' do
    it 'return false when player input stop' do
      result = subject.illegal_operation?('stop')
      expect(result).to be false
    end

    it 'return true when player input marked position' do
      board = TicTacToe::Board.new(
        [%w[o o o],
         %w[o o o],
         %w[o o o]]
      )
      game = TicTacToe::Game.new(board: board)
      result = game.illegal_operation?('0 0')
      expect(result).to be_truthy
    end
  end

  describe '#end?' do
    it 'return true when command is stop' do
      result = subject.end?('stop')
      expect(result).to eq true
    end

    it 'return true when board is bingo' do
      board = TicTacToe::Board.new(
        [[nil, 'o', 'o'],
         [nil, nil, nil],
         [nil, nil, nil]]
      )
      game = TicTacToe::Game.new(board: board)

      result = game.end?('0 0')
      expect(result).to eq true
    end
  end

  describe '#result' do
    it 'return result' do
      expect(subject.result).to eq 'drow'
    end
  end
end
