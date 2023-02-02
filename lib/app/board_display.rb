class BoardDisplay

  def initialize(board)
    @board = board
  end

  def display_all
    puts
    display_separator_line
    @board.rows.each do |row|
      display_row(row)
      display_separator_line
    end
    puts
  end
    
  def display_row(row)
    print '|'
    3.times do |i|
      display_square(row.squares[i])
      print '|'
    end
    puts
  end

  def display_square(square)
    print square.content
  end

  def display_separator_line
    puts '-' * 13 
  end
end
