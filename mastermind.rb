class Board

  @@guesses = 0
  @@four_digit_code = []

  def initialize
    puts "\nA new game has begun!"
  end

# changed new_code so that the class variable is still in array form to make
# guess checking easier through iteration
  def new_code
    four_digit_code = []
    4.times do
      a = rand(1..6)
      four_digit_code.push(a.to_i)
      @@four_digit_code.push(a.to_i)
    end
    print four_digit_code
  end

  def secret
   @@four_digit_code
  end

  def guesses
    puts "\nPlayer has guessed #{@@guesses} times."
  end

end

new_game = Board.new              # new game obj created
new_code = new_game.new_code      # new 4-digit created (array)

puts "\ntake a guess"
# this block takes user input and turns it into an array
guess = gets.chomp
guess = guess.split('')
guess_array = guess.map(&:to_i)

# x will be the secret code, y is the guess
def compare(x, y)
  if x == y
    puts 'correct'
  else
    puts 'INCORRECT'
  end
end

compare(new_game.secret, guess_array)
