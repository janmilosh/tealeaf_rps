class Player
  attr_accessor :name, :number_of_wins

  def initialize(name)
    if name == ''
      @name = 'You'
    else
      @name = name
    end
    @number_of_wins = 0
  end

  def increment_wins
    @number_of_wins += 1
  end
end

class Weapon
  CHOICES = ['r', 'p', 's']
  
  def self.valid_weapon?(weapon)
    CHOICES.include?(weapon)
  end

  def self.random_weapon
    ['r', 'p', 's'].shuffle.pop
  end
end

class Game
  def self.declare_winner(player1, player2, weapon1, weapon2)
    puts "#{player1.name} picked #{weapon1} and #{player2.name} picked #{weapon2}."
    if weapon1 == weapon2
      puts "It's a tie."
    elsif weapon1 == 'r' && weapon2 == 'p'
      puts "Paper wraps Rock, #{player2.name} won!"
      player2.increment_wins
    elsif weapon1 == 'p' && weapon2 == 's'
      puts "Scissors cuts paper, #{player2.name} won!"
      player2.increment_wins
    elsif weapon1 == 's' && weapon2 == 'r'
      puts "Rock crushes scissors, #{player2.name} won!"
      player2.increment_wins
    elsif weapon1 == 'r' && weapon2 == 's'
      puts "Rock crushes scissors, #{player1.name} won!"
      player1.increment_wins
    elsif weapon1 == 'p' && weapon2 == 'r'
      puts "Paper wraps Rock, #{player1.name} won!"
      player1.increment_wins
    elsif weapon1 == 's' && weapon2 == 'p'
      puts "Scissors cuts paper, #{player1.name} won!"
      player1.increment_wins
    end
  end

  def self.total_wins(player1, player2)
    puts
    puts "Total wins:"
    puts "#{player1.name}: #{player1.number_of_wins}"
    puts "#{player2.name}: #{player2.number_of_wins}"
  end

  def self.keep_playing?
    puts
    puts "Keep playing? (y/n)"
    gets.chomp.downcase
  end
end

def play_game
  # get inputs for players and weapons (player and computer)
  system "clear"
  puts "Play Paper, Rock, Scissors"
  
  puts "Please enter your name ==> "
  player1 = Player.new(gets.chomp)
  player2 = Player.new("The Computer")

  begin
    puts "Choose one: (p/r/s) ==> "
    weapon1 = gets.chomp.downcase
    weapon2 = Weapon.random_weapon
    puts

    if Weapon.valid_weapon?(weapon1)
      Game.declare_winner(player1, player2, weapon1, weapon2)
      Game.total_wins(player1, player2)
    else
      puts "That wasn't a valid input."
    end

    keep_playing = Game.keep_playing?
    system "clear"
  end while keep_playing == 'y'  
end

play_game