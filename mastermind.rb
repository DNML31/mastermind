class Board

  attr_accessor :guesses
  @@guesses = 12
  @@four_digit_code = []

  def initialize
    # puts "\nLet's play Mastermind!" 
    # puts "\nGuess the 4-digit code in 12 turns."
    # puts "A clue will be given after each turn."
    # puts "'X' for incorrect, 'O' for correct, and 'E' for correct but wrong place."
    # puts "\nDo you want to be the code MAKER (m) or BREAKER (b)?"
  end

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

  def clue(x, y)
    @@guesses -= 1
    result = []

    if @@guesses == 0
      puts 'You lose.'
    elsif x == y
      puts 'CORRECT! You win!'
      exit
    end
    # this loop only checks if number is in the correct spot
    for i in 0..3
      if x[i] == y[i]
        result.push('O')
      elsif x.include?(y[i])
        result.push('E')
      else
        result.push('X')
      end
    end
    print result.join('')
  end

  def make_or_break(x)
    if x == 'm'
      puts 'You are the code maker.'
    elsif x == 'b'
      puts 'You are the code breaker. Good luck.'
      play_game
    else
      puts 'Invalid input.'
      exit
    end
  end

  def play_game

    12.times do
      puts "\ntake a guess...\n"
      guess = gets.chomp
      guess = guess.split('')
      guess_array = guess.map(&:to_i)

      # clue and guesses taken block
      new_game.clue(new_game.secret, guess_array)
      new_game.guesses
    end

  end

end

new_game = Board.new

puts "\nLet's play Mastermind!" 
puts "\nGuess the 4-digit code in 12 turns."
puts 'A clue will be given after each turn.'
puts "'X' for incorrect, 'O' for correct, and 'E' for correct but wrong place."
puts "\nDo you want to be the code MAKER (m) or BREAKER (b)?"

x = gets.chomp
new_game.make_or_break(x)

