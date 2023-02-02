class Row
  attr_accessor :number, :squares

  def initialize(row_letter)
    self.squares = []
    1.upto(3) do |col_number|
      self.squares << Square.new(row_letter, col_number)
    end
  end

  def reset
    self.squares.each(&:reset)
  end
end
