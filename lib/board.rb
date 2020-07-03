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
    if incorrect_guesses.length != 6
      puts (6 - incorrect_guesses.length).to_s + " more wrong guesses until the Snowman appears!"
    end
    puts "\n\nIncorrect guesses: " + incorrect_guesses.join(" ") + "\n\n"
  end

  def word_solved?
    !@display_word.include?("_")
  end

end