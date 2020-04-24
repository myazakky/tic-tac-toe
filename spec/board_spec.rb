# frozen_string_literal: true

require 'rspec'
require_relative '../lib/tic_tac_toe'

RSpec.describe TicTacToe::Board do
  subject { TicTacToe::Board.new(cells) }
  let(:cells) { nil }

  describe '#cell' do
    it 'get cell status' do
      result = subject.cell(0, 0)
      expect(result).to eq nil
    end
  end

  describe 'mark' do
    it 'mark at a position' do
      result = subject.mark(1, 1, 'o')
      expect(result.cell(1, 1)).to eq 'o'
    end
  end

  describe 'cell_marked?' do
    it 'return true when the cell is marked' do
      marked = subject.mark(1, 1, 'o')
      result = marked.cell_marked?(1, 1, 'o')
      expect(result).to eq true
    end
  end

  context 'reach' do
    let(:cells) {
      [%w[o U o],
       %w[L C R],
       %w[o D o]]
    }

    describe 'horizontal_bingo?' do
      it 'return true when there are horizontal bingo' do
        board = subject.mark(1, 0, 'o')
        expect(board.horizontal_bingo?('o')).to eq true
      end

      describe 'vertical_bingo?' do
        it 'return true when there are vertical bingo' do
          board = subject.mark(0, 1, 'o')
          expect(board.vertical_bingo?('o')).to eq true
        end
      end

      describe 'diagonal_bingo?' do
        it 'return true when there are diagonal bingo' do
          board = subject.mark(1, 1, 'o')
          expect(board.diagonal_bingo?('o')).to eq true
        end
      end
    end

    describe 'bingo?' do
      it 'return true when there are horizontal bingo' do
        board = subject.mark(1, 0, 'o')
        expect(board.bingo?('o')).to eq true
      end

      it 'return true when there are vertical bingo' do
        board = subject.mark(0, 1, 'o')
        expect(board.bingo?('o')).to eq true
      end

      it 'return true when there are diagonal bingo' do
        board = subject.mark(1, 1, 'o')
        expect(board.bingo?('o')).to eq true
      end
    end
  end
end