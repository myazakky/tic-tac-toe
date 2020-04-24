# frozen_string_literal: true

require 'rspec'
require_relative '../lib/tic_tac_toe'

RSpec.describe TicTacToe::Player do
  subject { TicTacToe::Player.new(mark) }
  let(:board) { TicTacToe::Board.new }

  describe 'mark' do
    let(:mark) { 'o' }

    it 'mark' do
      marked_board = subject.mark(board, 1, 1)

      expect(marked_board.cell(1, 1)).to eq 'o'
    end
  end
end
