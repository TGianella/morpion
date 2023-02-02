class Board
  attr_accessor :rows, :columns, :diagonals

  def initialize
    initialize_rows
    initialize_columns
    initialize_diagonals
  end

  def initialize_rows
    self.rows = []
    ['A', 'B', 'C'].each do |row_letter|
      self.rows << Row.new(row_letter)
    end
  end

  def initialize_columns
    self.columns = []
    1.upto(3) do |col_number|
      initialize_column(col_number)
    end
  end

  def initialize_column(col_number)
    self.columns << []
    rows.each do |row|
      self.columns.last << row.squares[col_number - 1]
    end
  end

  def initialize_diagonals
    self.diagonals = [[],[]]
    initialize_first_diagonal
    initialize_second_diagonal
  end

  def initialize_first_diagonal
    3.times do |i|
      self.diagonals[0] << rows[i].squares[i]
    end
  end
  
  def initialize_second_diagonal
    3.times do |i|
      self.diagonals[1] << rows[2 - i].squares[i]
    end
  end

  def reset
    self.rows.each(&:reset)
  end
end
