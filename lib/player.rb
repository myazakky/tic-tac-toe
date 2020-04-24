# frozen_string_literal: true

module TicTacToe
  class Player
    def initialize(mark)
      @mark = mark
    end

    def mark(board, point_x, point_y)
      board.mark(point_x, point_y, @mark)
    end
  end
end
