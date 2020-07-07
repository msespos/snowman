class Game

  require 'yaml'

  ALPHABET = [*("a".."z")]

  def initialize
    @secret_word = ""
    @unguessed_letters = ALPHABET
    @correct_guesses = []
    @incorrect_guesses = []
  end

  def save_text
    puts "There are 3 slots to save in, labeled 1, 2, and 3."
    puts "Please select a number. You will overwrite any already saved game in that slot."
  end

  def slot
    slot = gets.chomp
    until ["1", "2", "3"].include? slot
      puts "Please select a number between 1 and 3."
      slot = gets.chomp
    end
    slot
  end

  def to_yaml
    YAML.dump ({
      secret_word: @secret_word,
      unguessed_letters: @unguessed_letters,
      correct_guesses: @correct_guesses,
      incorrect_guesses: @incorrect_guesses,
      board: @board
    })
  end

  def save_game
    save_text
    File.open("saved_games/snowman_save_#{slot}.yml", "w").puts(to_yaml)
    puts "Game saved! Let's get back to the game."
  end

  def guessed_already?(guess)
    @correct_guesses.include?(guess) || @incorrect_guesses.include?(guess)
  end

  def check_guess(guess)
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

  def user_input
    puts "Please enter a letter that you have not guessed yet."
    puts "(If you would like to save the game, enter the word 'save.')"
    user_input = gets.chomp.downcase
    user_input == "save" ? save_game : check_guess(user_input)
  end

  def refile_guess(guess)
    @secret_word.include?(guess) ? @correct_guesses.push(guess) : @incorrect_guesses.push(guess)
    @unguessed_letters.delete(guess)
  end

  def finish
    if @board.word_solved?
      puts "Congratulations! You win!\n"
    else
      puts "You lose!\nThe word was #{@secret_word}!\n"
    end
  end

  def play
    until @board.word_solved? || @incorrect_guesses.length == 6
      guess = user_input
      next if guess.nil?
      refile_guess(guess)
      @board.replace_dashes(guess)
      @board.display_turn(@incorrect_guesses, guess)
    end
    finish
  end

  def intro_text
    puts <<~HEREDOC
      Welcome to Snowman!
      Your job is to guess the secret word before the Snowman appears.
      He appears after six wrong guesses.
      Good luck!

    HEREDOC
  end

  def load_game?
    puts "Would you like to load a saved game?\nEnter y for yes, any other key for no"
    gets.chomp.downcase == "y"
  end

  def load_text
    puts "There are 3 slots that a game could be saved in, labeled 1, 2, and 3."
    puts "Please select a number. You should have saved a game in that slot already."
  end

  def from_yaml(game)
    status = YAML.load(File.read(game))
    @secret_word = status[:secret_word]
    @unguessed_letters = status[:unguessed_letters]
    @correct_guesses = status[:correct_guesses]
    @incorrect_guesses = status[:incorrect_guesses]
    @board = status[:board]
  end

  def load_game
    load_text
    from_yaml("saved_games/snowman_save_#{slot}.yml")
  end

  def new_secret_word
    word_list = File.readlines "5desk.txt"
    word_list.map! { |word| word[0..-3] }
    word_list.delete_if { |word| word != word.downcase || word.length < 5 || word.length > 12 }
    @secret_word = word_list.sample
  end

  def display_dashes
    puts "The word has the following number of letters:\n"
    @board.all_dashes
  end

  def start
    intro_text
    if load_game?
      load_game
      @board.display_turn(@incorrect_guesses)
    else
      @board = Board.new(new_secret_word)
      display_dashes
    end
    play
  end

end