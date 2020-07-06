class Board

  def initialize(secret_word)
    @secret_word = secret_word.chars
    @display_word = []
    secret_word.length.times { |i| @display_word[i] = "_" }
    @guesses = []
    @figure = Figure.new
  end

  def all_dashes
    puts "_ " * (@secret_word.length - 1) + "_\n\n"
  end

  def replace_dashes(guess)
    @display_word.length.times { |i| @display_word[i] = guess if @secret_word[i] == guess }
    @guesses.push(guess)
  end

  def word_solved?
    !@display_word.include?("_")
  end

  def display_num_wrong_guesses_left(incorrect_guesses)
    unless word_solved? || incorrect_guesses.length == 6
      puts (6 - incorrect_guesses.length).to_s + " more wrong guesses until the Snowman appears!"
    end
  end

  def display_incorrect_guesses(incorrect_guesses)
    if incorrect_guesses == []
      puts "\nIncorrect guesses: none\n\n"
    else
      puts "\nIncorrect guesses: " + incorrect_guesses.join(" ") + "\n\n"
    end
  end

  def display_turn(incorrect_guesses, guess = nil)
    @figure.snowman(incorrect_guesses.length)
    puts "Correct guess!\n\n" if @secret_word.include?(guess)
    puts @display_word.join(" ") + "\n\n"
    display_num_wrong_guesses_left(incorrect_guesses)
    display_incorrect_guesses(incorrect_guesses)
  end

end