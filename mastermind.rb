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

    cpu_guess = []
    4.times do
      a = rand(1..6)
      cpu_guess.push(a.to_i)
    end
    puts "\nCPU guessed #{cpu_guess}."

    clue = []

    for i in 0..3
      if user_code[i] == cpu_guess[i]
        clue.push('O')
      elsif user_code.include?(cpu_guess[i])
        clue.push('E')
      else
        clue.push('X')
      end
    end

    guesses -= 1

    bank = [1, 2, 3, 4, 5, 6]
    e_bank = []
    pre_guess = []

    for i in 0..3
      if clue[i] == 'X'
        bank.delete(cpu_guess[i])
        pre_guess.push('X')
      elsif clue[i] == 'O'
        pre_guess[i] = cpu_guess[i]
      elsif clue[i] == 'E'
        e_bank.push(cpu_guess[i])
        pre_guess.push('E')
      end
    end
    print "\n#{pre_guess}  <-- CPU pre guess"
    print "\n\n#{bank}  <-- bank"
    print "\n#{e_bank.uniq}   <-- e_bank"

    # where to loop? - until guesses = 0 or next_guess == user_code

    # should this block be (for i in 0..3) also?
    next_guess = []
    pre_guess.map do |element|
      if element == Integer
        next_guess.push(element)
      elsif element == 'E'
        next_guess.push(e_bank.sample)
      elsif element == 'X'
        next_guess.push((bank - e_bank).sample)
      end
    end
    print "\n\n#{next_guess}  <-- next_guess"
    ###

  end

end

new_game = Board.new
new_game.new_code

puts "\nLet's play Mastermind!"
puts "\nGuess the 4-digit code in 12 turns."
puts 'A clue will be given after each turn.'
puts "'X' for incorrect, 'O' for correct, and 'E' for correct but wrong place."
puts "\nDo you want to be the code MAKER (m) or BREAKER (b)?"

# decides whether user is breaker, maker or exits
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
