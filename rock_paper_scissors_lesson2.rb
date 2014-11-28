class Player
  attr_accessor :name, :number_of_wins, :weapon

  def initialize(name)
    @name = name == '' ? 'You' : name
    @number_of_wins = 0
  end

  def increment_wins
    @number_of_wins += 1
  end

  def choose_weapon
    @weapon = name == 'The Computer' ? Weapon.random : Weapon.choice
  end
end


class Weapon
  CHOICES = ['r', 'p', 's']
  
  def self.valid?(weapon)
    CHOICES.include?(weapon)
  end

  def self.random
    CHOICES.sample
  end

  def self.choice
    print "Choose one: (r/p/s) ==> "
    gets.chomp.downcase
  end
end


class Game
  def play(player1, player2)
    player1.choose_weapon
    player2.choose_weapon
    
    if Weapon.valid?(player1.weapon)
      declare_winner(player1, player2)
      total_wins(player1, player2)
    else
      puts "That wasn't a valid input."
    end
  end

  def declare_winner(player1, player2)
    system "clear"
    puts "#{player1.name} picked #{player1.weapon} and #{player2.name} picked #{player2.weapon}.\n\n"
    if player1.weapon == player2.weapon
      puts "It's a tie."
    elsif player1.weapon == 'r' && player2.weapon == 'p'
      puts "Paper wraps Rock. #{player2.name} won!"
      player2.increment_wins
    elsif player1.weapon == 'p' && player2.weapon == 's'
      puts "Scissors cuts paper. #{player2.name} won!"
      player2.increment_wins
    elsif player1.weapon == 's' && player2.weapon == 'r'
      puts "Rock crushes scissors. #{player2.name} won!"
      player2.increment_wins
    elsif player1.weapon == 'r' && player2.weapon == 's'
      puts "Rock crushes scissors. #{player1.name} won!"
      player1.increment_wins
    elsif player1.weapon == 'p' && player2.weapon == 'r'
      puts "Paper wraps Rock. #{player1.name} won!"
      player1.increment_wins
    elsif player1.weapon == 's' && player2.weapon == 'p'
      puts "Scissors cuts paper. #{player1.name} won!"
      player1.increment_wins
    end
  end

  def total_wins(player1, player2)
    puts "\n   Total Wins   "
    puts "~~~~~~~~~~~~~~~~"
    puts "#{player1.name}: #{player1.number_of_wins}"
    puts "#{player2.name}: #{player2.number_of_wins}\n\n"
  end

  def keep_playing?
    print "Keep playing? (y/n) ==> "
    gets.chomp.downcase
  end
end


def play_game
  system "clear"
  puts "Play Paper, Rock, Scissors"
  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n"

  print "Please enter your name ==> "
  player1 = Player.new(gets.chomp)
  player2 = Player.new("The Computer")

  begin
    system "clear"
    game = Game.new
    game.play(player1, player2)
  end while game.keep_playing? == 'y'  
end

play_game