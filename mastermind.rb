class Board
  # include Solve
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
    result = []

    if @@guesses == 0
      puts 'You lose.'
    elsif code == guess
      puts 'CORRECT! You win!'
      exit
    end
    # this loop only checks if number is in the correct spot
    for i in 0..3
      if code[i] == guess[i]
        result.push('O')
      elsif x.include?(y[i])
        result.push('E')
      else
        result.push('X')
      end
    end
    print result.join('')
  end

  def cpu_solve(user_code)
    puts 'CPU guessing...'
    print user_code

    cpu_guess = []
    4.times do
      a = rand(1..6)
      cpu_guess.push(a.to_i)
    end
    print cpu_guess

    result = []
    for i in 0..3
      if user_code[i] == cpu_guess[i]
        result.push('O')
      elsif user_code.include?(cpu_guess[i])
        result.push('E')
      else
        result.push('X')
      end
      # this is printing 10 characters (wtf?)
      print result.join('')
    end

    # 12 times loop
    # cpu takes guess
    # decrement @@guesses
    # give CPU a clue

  end

end

new_game = Board.new
new_game.new_code

puts "\nLet's play Mastermind!" 
puts "\nGuess the 4-digit code in 12 turns."
puts 'A clue will be given after each turn.'
puts "'X' for incorrect, 'O' for correct, and 'E' for correct but wrong place."
puts "\nDo you want to be the code MAKER (m) or BREAKER (b)?"

x = gets.chomp
if x == 'm'

  puts 'You are the code maker.'
  puts 'Enter a 4-digit code using the numbers 1-6 for the CPU to break...'

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
