class BoardDisplayRules < BoardDisplay
  
  def display_square(square)
    print ' ' + square.position.join('') + ' '
  end

  def display_separator_line
    puts '-' * 16
  end
end
