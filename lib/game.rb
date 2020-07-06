class Game

  require 'yaml'

  ALPHABET = [*("a".."z")]

  def initialize
    @secret_word = ""
    @unguessed_letters = ALPHABET
    @correct_guesses = []
    @incorrect_guesses = []
  end

  def new_secret_word
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
    puts "Please enter a letter that you have not guessed yet."
    puts "(If you would like to save the game, enter the word 'save.')"
    selection = gets.chomp.downcase
    if selection == "save"
      save_game
    else
      guess = selection
      while guessed_already?(guess) || !ALPHABET.include?(guess)
        if guessed_already?(guess)
          puts "You've already guessed that letter! Please try again."
        else
          puts "That is not a letter! Please try again."
        end
        guess = gets.chomp.downcase
      end
    end
    guess
  end

  def refile_guess(guess)
    in_secret_word?(guess) ? @correct_guesses.push(guess) : @incorrect_guesses.push(guess)
    @unguessed_letters.delete(guess)
  end

  def to_yaml
    YAML.dump ({
      :secret_word => @secret_word,
      :unguessed_letters => @unguessed_letters,
      :correct_guesses => @correct_guesses,
      :incorrect_guesses => @incorrect_guesses,
      :board => @board
    })
  end

  def from_yaml(game)
    status = YAML.load(File.read(game))
    @secret_word = status[:secret_word]
    @unguessed_letters = status[:unguessed_letters]
    @correct_guesses = status[:correct_guesses]
    @incorrect_guesses = status[:incorrect_guesses]
    @board = status[:board]
  end

  def save_text
    puts "There are 3 slots to save in, labeled 1, 2, and 3."
    puts "Please select a number. You will overwrite any already saved game in that slot."
  end

  def load_text
    puts "There are 3 slots that a game could be saved in, labeled 1, 2, and 3."
    puts "Please select a number. You should have saved a game in that slot already."
  end

  def slot
    slot = gets.chomp
    until slot == "1" || slot == "2" || slot == "3"
      puts "Please select a number between 1 and 3."
      slot = gets.chomp
    end
    slot
  end

  def load_game?
    puts "Would you like to load a saved game?\nEnter y for yes, any other key for no"
    gets.chomp.downcase == "y"
  end

  def save_game
    save_text
    File.open("saved_games/snowman_save_#{slot}.yml", "w").puts(to_yaml)
    puts "Game saved! Let's get back to the game."
  end

  def load_game
    load_text
    from_yaml("saved_games/snowman_save_#{slot}.yml")
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
      guess = get_guess
      refile_guess(guess) if guess != "save"
      @board.replace_dashes(guess) if guess != "save"
      @board.display_turn(@incorrect_guesses, guess)
    end
    finish
  end

  def display_dashes
    puts "The word has the following number of letters:\n"
    @board.all_dashes
  end

  def intro_text
    puts <<~HEREDOC
      Welcome to Snowman!
      Your job is to guess the secret word before the Snowman appears.
      You get five wrong guesses before he does.
      Good luck!

    HEREDOC
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