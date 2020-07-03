class Board

  def initialize(secret_word)
    @secret_word = secret_word.chars
    @display_word = []
    secret_word.length.times { |i| @display_word[i] = "_" }
    @guesses = []
    p @secret_word
    @figure = Figure.new
  end

  def replace_dashes(guess)
    @display_word.length.times { |i| @display_word[i] = guess if @secret_word[i] == guess }
    @guesses.push(guess)
  end

  def print_turn(incorrect_guesses)
    @figure.snowman(incorrect_guesses.length)
    puts @display_word.join(" ") + "\n\n"
    puts (6 - incorrect_guesses.length).to_s + " more guesses wrong until the Snowman appears!\n"
    puts "Incorrect guesses: " + incorrect_guesses.join(" ") + "\n\n"
  end

end