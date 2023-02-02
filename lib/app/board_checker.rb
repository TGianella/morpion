class BoardChecker
  attr_accessor :board, :symbol

  def initialize(board, symbol)
    @board = board
    @symbol = symbol
  end

  def check_rows
    board.rows.any? { |row| check_row(row) }
  end

  def check_row(row)
    row.squares.all? { |square| square.content.include?(symbol) }
  end

  def check_cols_or_diags(dimension)
    dimension.any? { |line| check_col_or_diag(line) }
  end

  def check_col_or_diag(line)
    line.all? { |square| square.content.include?(symbol) }
  end

  def three_aligned? 
    check_rows || check_cols_or_diags(board.columns) || check_cols_or_diags(board.diagonals)
  end
end



