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
    #puts "Initialized rows : #{rows}"
  end

  def initialize_columns
    self.columns = []
    1.upto(3) do |col_number|
      self.columns << []
      rows.each do |row|
        self.columns.last << row.squares[col_number - 1]
      end
    end
    #puts "Initialized columns : #{columns}"
  end

  def initialize_diagonals
    self.diagonals = [[],[]]
    3.times do |i|
      self.diagonals[0] << rows[i].squares[i]
    end
    3.times do |i|
      self.diagonals[1] << rows[2 - i].squares[i]
    end
    #puts "Initialized diagonals : #{diagonals}"
  end

  def reset
    self.rows.each(&:reset)
  end
end
