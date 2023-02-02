class Player
  attr_accessor :name, :symbol, :score, :color, :valid_color
  @@nb_players = 0

  def initialize(name=nil)
    @@nb_players += 1
    set_name(name)
    ask_color
    attribute_symbols
    self.score = 0
  end

  def set_name(name)
    if name.nil?
      ask_name
    else
      self.name = name
    end
  end

  def ask_name
    puts "Quel est le nom du joueur #{@@nb_players} ?"
    self.name = gets.chomp
    puts
  end
  
  def ask_color
    puts "De quelle couleur veux-tu que soient tes pions ?"
    show_colors
    while !valid_color
      colors_menu
    end
    puts
  end

  def show_colors
    puts "Entre le nombre correspondant à la couleur que tu souhaites prendre :"
    puts "1 - #{'red'.red}  2 - #{'green'.green}  3 - #{'yellow'.yellow}\n4- #{'blue'.blue}  5 - #{'magenta'.magenta}  6 - #{'cyan'.cyan}"
    self.valid_color = false
  end

  def colors_menu
    input = gets.chomp.to_i
    case input
    when 1
      self.color = :red
    when 2
      self.color = :green
    when 3
      self.color = :yellow
    when 4
      self.color = :blue
    when 5
      self.color = :magenta
    when 6
      self.color = :cyan
    else
      puts "Entre un nombre entre 1 et 6"
      return
    end
    self.valid_color = true
  end

  def attribute_symbols
    if @@nb_players.odd?
      self.symbol = "X" 
    else
      self.symbol = "O"
    end
  end

  def play(board, coords)
    if correct_input?(coords)
      square = find_board_square_from_coords(board, coords)
      if square.is_empty? 
        square.content = " #{symbol.send(color)} " 
      else
        return full_square
      end
    else
      return wrong_coords_input
    end
  end

  def correct_input?(square)
    square.match? /^[A-C]{1}[1-3]{1}/
  end
   
  def find_board_square_from_coords(board, coords)
    row = coords[0].ord - 'A'.ord
    col = coords[1].to_i - 1
    board.rows[row].squares[col]
  end

  def full_square
    puts 'Cette case est déjà remplie'
    puts
    0
  end

  def wrong_coords_input
    puts 'Je ne comprends pas... Le format requis est A, B ou C pour la ligne et 1, 2 ou 3 pour la colonne (ex. B2 pour la case centrale).'
    puts
    0
  end
end
