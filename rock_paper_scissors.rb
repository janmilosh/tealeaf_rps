puts "Play Paper Rock Scissors!"


def get_long_input(input)
  case input.downcase
  when 'r'
    return 'Rock'
  when 'p'
    return 'Paper'
  when 's'
    return 'Scissors'
  else
    return false
  end
end

def evaluate(user_input, computer_input)
  puts "You picked #{user_input} and computer picked #{computer_input}."
  if user_input == coomputer_input
    puts "It's a tie."
  elsif user_input == 'Rock' and computer_input == 'Paper'
    puts "Paper wraps Rock!\nComputer Won!"
  elsif user_input == 'Paper' and computer_input == 'Scissors'
    puts "Scissors cuts paper!\nComputer Won!"
  elsif user_input == 'Scissors' and computer_input == 'Rock'
    puts "Rock crushes scissors!\nComputer Won!"
  elsif user_input == 'Rock' and computer_input == 'Scissors'
    puts "Rock crushes scissors!\nYou Won!"
  elsif user_input == 'Paper' and computer_input == 'Rock'
    puts "Paper wraps Rock!\nYou Won!"
  elsif user_input == 'Scissors' and computer_input == 'Paper'
    puts "Scissors cuts paper!\nYou Won!"
  end
end

def get_computer_input
  choices = ['Rock', 'Paper', 'Scissors']
  return choices.sample
end

def get_user_input
  puts "Choose one: (P/R/S)"
  user_input = gets.chomp
  get_long_input(user_input)
end

def play_game
  loop do
    user_input = get_user_input
    if user_input != false
      computer_input = get_computer_input
      evaluate(user_input, computer_input)
    else
      puts "That wasn't a valid input."
    end
    puts "Keep playing? (Y/N)"
    continue = gets.chomp
    if continue.downcase == 'y'
      continue
    else
      break
    end
  end
end

play_game