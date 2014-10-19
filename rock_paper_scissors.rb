puts "Play Rock Paper Scissors!"

CHOICES = {'r' => 'Rock', 'p' => 'Paper', 's' => 'Scissors'}

def display_results(user_input, computer_input)
  puts "You picked #{user_input} and computer picked #{computer_input}."
  if user_input == computer_input
    puts "It's a tie."
  elsif user_input == 'Rock' && computer_input == 'Paper'
    puts "Paper wraps Rock!\nComputer Won!"
  elsif user_input == 'Paper' && computer_input == 'Scissors'
    puts "Scissors cuts paper!\nComputer Won!"
  elsif user_input == 'Scissors' && computer_input == 'Rock'
    puts "Rock crushes scissors!\nComputer Won!"
  elsif user_input == 'Rock' && computer_input == 'Scissors'
    puts "Rock crushes scissors!\nYou Won!"
  elsif user_input == 'Paper' && computer_input == 'Rock'
    puts "Paper wraps Rock!\nYou Won!"
  elsif user_input == 'Scissors' && computer_input == 'Paper'
    puts "Scissors cuts paper!\nYou Won!"
  end
end

def play_game
  begin
    puts "Choose one: (P/R/S)"
    user_input = CHOICES[gets.chomp.downcase]
    if user_input
      computer_input = CHOICES.values.sample
      display_results(user_input, computer_input)
    else
      puts "That wasn't a valid input."
    end
    puts "Keep playing? (Y/N)"
    keep_playing_response = gets.chomp.downcase    
  end while keep_playing_response == 'y'
end

play_game