class Board
  def initialize(guess, clue)
    @guess = guess
    @clue = clue
    puts "Your guess: #{guess}      Clue: XXXX"
  end

end

class Code

  def initialize
    # initializing new obj creates 4-digit code using 1-6
    four_digit = []

    4.times do
      a = rand(1..6)
      four_digit.push(a)
    end

    four_digit = four_digit.join
    print four_digit

  end

end

class Guess

end

code = Code.new

# board = Board.new(code, 6543)