class Game

  ALPHABET = [*("a".."z")]

  def initialize
    @secret_word = ""
    @unguessed_letters = ALPHABET
    @correct_guesses = []
    @incorrect_guesses = []
  end

  def secret_word
    word_list = File.readlines "5desk.txt"
    word_list.map! { |word| word[0..-3] }
    word_list.delete_if { |word| word != word.downcase || word.length < 5 || word.length > 12 }
    @secret_word = word_list.sample
  end

  def guessed_already?(letter)
    @correct_guesses.include?(letter) || @incorrect_guesses.include?(letter)
  end

  def in_secret_word?(letter)
    @secret_word.include?(letter)
  end

  def get_guess
    puts "Please enter a letter that you have not already guessed."
    guess = gets.chomp.downcase
    while guessed_already?(guess) || !ALPHABET.include?(guess)
      if guessed_already?(guess)
        puts "You've already guessed that letter! Please try again."
      else
        puts "That is not a letter! Please try again."
      end
      guess = gets.chomp.downcase
    end
    guess
  end

  def refile_guess(guess)
    in_secret_word?(guess) ? @correct_guesses.push(guess) : @incorrect_guesses.push(guess)
    @unguessed_letters.delete(guess)
  end

  def start
    @board = Board.new(secret_word)
    first_guess = get_guess
    refile_guess(first_guess)
    @board.replace_dashes(first_guess)
    @board.print_turn(@incorrect_guesses)
  end

end