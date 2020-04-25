# frozen_string_literal: true

module TicTacToe
  class Game
    def initialize(turn_player: nil, wating_player: nil, board: nil)
      @turn_player = turn_player || TicTacToe::Player.new('o')
      @wating_player = wating_player || TicTacToe::Player.new('x')
      @board = board || TicTacToe::Board.new
    end

    def start
      print(@board.display + "\n")
      print("(#{@turn_player.char_mark})>> ")
      command = readline.chomp

      start if illegal_operation?(command)

      return result if end?(command)

      point_x, point_y = command.split(' ').map(&:to_i)

      Game.new(
        turn_player: @wating_player,
        wating_player: @turn_player,
        board: @turn_player.mark(@board, point_x, point_y)
      ).start
    end

    def illegal_operation?(command)
      return false if command.match?(/stop/)
      return true unless command.match?(/[0-9] [0-9]/)

      point_x, point_y = command.split(' ').map(&:to_i)

      @board.cell_marked?(point_x, point_y)
    end

    def end?(command)
      return true if command == 'stop'

      point_x, point_y = command.split(' ').map(&:to_i)
      marked_board = @turn_player.mark(@board, point_x, point_y)

      marked_board.bingo?(@turn_player.char_mark)
    end

    def result
      if @board.bingo?(@turn_player.char_mark)
        "#{@turn_player.char_mark} is winner"
      elsif @board.bingo?(@wating_player.char_mark)
        "#{@wating_player.char_mark} is winner"
      else
        'drow'
      end
    end
  end
end
