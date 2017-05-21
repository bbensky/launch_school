require 'pry'

class Queens
  attr_reader :white, :black

  def initialize(white: [0, 3], black: [7, 3])
    raise ArgumentError if white == black
    @white = white
    @black = black

    @white_marker = 'W'
    @black_marker = 'B'
  end

  def to_s
    build_board
    place_pieces

    @board.map { |line| line.join(" ") }.join("\n")
  end

  def attack?
    same_row? || same_column? || same_diagonal?
  end

  private

  def build_board
    @board = []
    8.times { @board << (['_'] * 8) }
  end

  def place_pieces
    @board[@white[0]][@white[1]] = @white_marker
    @board[@black[0]][@black[1]] = @black_marker
  end

  def same_row?
    @white[0] == @black[0]
  end

  def same_column?
    @white[1] == @black[1]
  end

  def same_diagonal?
    row_diff = @white[0] - @black[0]
    col_diff = @white[1] - @black[1]

    row_diff.abs == col_diff.abs
  end
end

queens = Queens.new

puts queens.to_s