class Board

  @@guesses = 0

  def new_code
    @four_digit_code = four_digit_code = []
    4.times do
      a = rand(1..6)
      four_digit_code.push(a)
    end
    @four_digit_code = four_digit_code.join
    print @four_digit_code
  end

  def guesses
    puts "\n#{@@guesses}"
  end

  def initialize
    @@guesses += 1
    puts 'A new game has begun!'
  end

end


new_game = Board.new
new_game.new_code

new_game.guesses
# when a new game starts we need: 4-digit code, guess, clue, how many turns