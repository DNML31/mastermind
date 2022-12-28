class Board
  attr_accessor :guesses
  @@guesses = 12
  @@four_digit_code = []

  def initialize ; end

  def new_code
    four_digit_code = []
    4.times do
      a = rand(1..6)
      four_digit_code.push(a.to_i)
      @@four_digit_code.push(a.to_i)
    end
  end

  def secret
    @@four_digit_code
  end

  def guesses
    puts "\n#{@@guesses} guesses left."
  end

  def solve(code, guess)
    @@guesses -= 1
    clue = []

    if @@guesses == 0
      puts 'You lose.'
    elsif code == guess
      puts 'CORRECT! You win!'
      exit
    end
    
    for i in 0..3
      if code[i] == guess[i]
        clue.push('O')
      elsif code.include?(guess[i])
        clue.push('E')
      else
        clue.push('X')
      end
    end
    print clue.join('')
  end

  def cpu_solve(user_code)
    guesses = 12
    puts "\nCPU guessing..."

    guess = []
    4.times do
      a = rand(1..6)
      guess.push(a.to_i)
    end

    if guess == user_code
      puts "CPU broke your code."
      exit
    else 
      until (guess == user_code || guesses == 0) do
        if guess == user_code
          puts "CPU broke your code."
          exit
        elsif guess != user_code

          guesses -= 1

          clue = []
          for i in 0..3
            if user_code[i] == guess[i]
              clue.push(guess[i])
            elsif user_code.include?(guess[i])
              clue.push('E')
            elsif !user_code.include?(guess[i])
              clue.push('X')
            end
          end

          bank = [1, 2, 3, 4, 5, 6]
          e_bank = []

          for i in 0..3
            if clue[i] == 'X'
              bank.delete(guess[i])
              guess.push(bank.sample)
            elsif clue[i].is_a? Integer
              guess.push(guess[i])
            elsif clue[i] == 'E'
              e_bank.push(guess[i])
              e_bank.uniq
              guess.push((e_bank + bank).sample)
            end
          end
          guess.slice!(0..3)

          print "\n\nCPU guessed #{guess}. #{guesses} guesses left."

        elsif guesses == 0
          puts "CPU couldn't break your code."
        end
      end
    end

  end

end

new_game = Board.new
new_game.new_code

puts "\nLet's play Mastermind!"
puts "\n* Using the numbers 1-6, a 4-digit code will be MADE."
puts '* BREAK the 4-digit code in 12 turns.'
puts "* A clue will be given for each digit's place after each turn:"
puts "\t'X' for an incorrect number."
puts "\t'O' for a correct number."
puts "\t'E' for correct number but in the wrong place."
puts "\nDo you want to be the code MAKER (m) or BREAKER (b)?"

x = gets.chomp
if x == 'm'

  puts "\nYou are the code maker."
  puts "\nEnter a 4-digit code using the numbers 1-6 for the CPU to break..."

  y = gets.chomp
  y = y.split('')
  user_code = y.map(&:to_i)

  new_game.cpu_solve(user_code)

elsif x == 'b'

  puts 'You are the code breaker. Good luck.'

  12.times do
    puts "\ntake a guess...\n"
    guess = gets.chomp
    guess = guess.split('')
    guess_array = guess.map(&:to_i)

    new_game.solve(new_game.secret, guess_array)
    new_game.guesses
  end

else

  puts 'Invalid input.'
  exit

end
