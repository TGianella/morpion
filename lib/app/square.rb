class Square
  attr_accessor :content, :position

  def initialize(row_letter, col_number)
    self.position = [row_letter, col_number]
    self.content = '   '
  end

  def reset
    self.content = '   '
  end

  def is_empty?
    self.content == '   '
  end
end
