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

    it 'dont mark at the other position' do
      result = subject.mark(1, 1, 'o')
      expect(result.cell(1, 0)).to eq nil
    end
  end

  describe 'cell_marked?' do
    it 'return false when the cell is nil' do
      expect(subject.cell_marked?(0, 0)).to eq false
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

    describe '#display' do
      let(:cells) {
        [%w[x o x],
         %w[o x o],
         %w[x o x]]
      }

      it 'convert to string for display' do
        expected = "x o x\no x o\nx o x"

        expect(subject.display).to eq expected
      end
    end
  end
end
