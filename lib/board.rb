class Board

  def initialize(secret_word)
    @secret_word = secret_word.chars
    @display_word = []
    secret_word.length.times { |i| @display_word[i] = "_" }
    @guesses = []
    p @secret_word
    p @display_word
    @figure = Figure.new
  end

  def print_display_word
    @figure.snowman(6)
    puts @display_word.join(" ") + "\n\n"
    puts @guesses.join(" ")
  end

  def replace_dashes(guess)
    @display_word.length.times { |i| @display_word[i] = guess if @secret_word[i] == guess }
    @guesses.push(guess)
    print_display_word
  end

end