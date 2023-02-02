class Game
  attr_accessor :board, :players, :winner, :turn_count
  @@game_number = 0

  def initialize(players)
    @@game_number += 1
    self.board = Board.new
    self.players = players
    self.winner = nil
    self.turn_count = 0
  end
  
  def ask_player_move(player)
    puts "Quel est ton prochain coup #{player.name} ?"
    input = gets.chomp.upcase
    puts
    input
  end

  def is_still_ongoing?
    winner.nil? && turn_count < 9
  end

  def display_board
    BoardDisplay.new(board).display_all
  end
  
  def start_game
    puts "Partie #{@@game_number}"
    display_board
  end
  
  def take_turn
    players.each do |player|
      player_turn(player)
    end
  end
  
  def player_move(player)
    valid_move = false
    while !valid_move && turn_count < 9
      valid_move = true unless player.play(board, ask_player_move(player)) == 0
    end
  end
  
  def check_victory(player)
    if BoardChecker.new(board, player.symbol).three_aligned?
      self.winner = player.name
      player.score += 1
    end
  end
  
  def player_turn(player)
    if is_still_ongoing?
      player_move(player)
      self.turn_count += 1
      check_victory(player) if turn_count >= 5
      display_board
    end
  end

  def end_game
    if winner.nil?
      puts "Egalité !"
    else
      puts "#{winner} a gagné !"
    end
    puts
  end

  def perform
    start_game
    while is_still_ongoing?
      take_turn
    end
    end_game
  end
end
