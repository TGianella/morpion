class TicTacToe
  attr_accessor :players, :another_game, :bad_input

  def initialize
    self.another_game = true
  end

  def introduction
    puts "MORPION à deux joueurs"
    puts
    initialize_players
    show_players_colors
    show_rules
  end

  def initialize_players
    self.players = []
    2.times do |_|
      self.players << Player.new
    end
  end
  
  def show_players_colors
    players.each do |player|
      color = player.color
      puts "#{player.name} joue les #{player.symbol.send(color)}"
    end
    puts
  end

  def show_rules
    puts "Pour indiquer la case sur laquelle vous voulez jouer, entrez le code correspondant lorsque c'est votre tour :"
    BoardDisplayRules.new(Board.new).display_all
  end

  def display_score
    puts "#{players[0].name} #{players[0].score.to_s.send(players[0].color)} - #{players[1].score.to_s.send(players[1].color)} #{players[1].name}"
  end

  def ending
    puts "Le score final est :"
    display_score
    show_winner
  end

  def show_winner
    if winner?
      winner
    else
      tie
    end
  end

  def winner?
    players[0].score != players[1].score
  end

  def winner
    puts "#{players.max_by { |player| player.score }.name} a gagné !"
  end

  def tie
    puts "Les deux joueurs sont à égalité !"
  end

  def ask_for_another_game
    puts "Voulez-vous faire une autre partie ? (y/n)"
    get_answer
    puts
  end

  def get_answer
    self.bad_input = true
    while bad_input
      check_input(gets.chomp)
      puts
    end
  end

  def check_input(input)
    if input.upcase.match? /^[YN]{1}$/
      right_input(input)
    else
      wrong_input
    end
  end

  def right_input(input)
    self.bad_input = false
    self.another_game = false if input.upcase == 'N'
  end
  
  def wrong_input
    puts "Je ne comprends pas, tapez 'y' pour refaire une partie ou 'n' pour terminer"
  end

  def play_game
    display_score
    Game.new(players).perform
    ask_for_another_game
  end

  def perform
    introduction
    while another_game
      play_game
    end
    ending
  end
end

