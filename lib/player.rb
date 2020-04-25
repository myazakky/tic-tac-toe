# frozen_string_literal: true

module TicTacToe
  class Player
    attr_reader :char_mark

    def initialize(char_mark)
      @char_mark = char_mark
    end

    def mark(board, point_x, point_y)
      board.mark(point_x, point_y, @char_mark)
    end
  end
end
