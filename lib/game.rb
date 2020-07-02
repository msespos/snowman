class Game

  ALPHABET = [*("a".."z")]

  def initialize
    @secret_word = ""
    @figure = Figure.new
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

  def move_letter(letter)
    in_secret_word?(letter) ? @correct_guesses.push(letter) : @incorrect_guesses.push(letter)
  end

  def get_guess
    puts "Please enter a letter that you have not already guessed"
    guess = gets.chomp.downcase
    while guessed_already?(guess) || !ALPHABET.include?(guess)
      if guessed_already?(guess)
        puts "You've already guessed that letter! Please try again"
      else
        puts "That is not a letter! Please try again"
      end
      guess = gets.chomp.downcase
    end
    guess
  end
  
    # if guess is legit, check if it's in the secret word
    # if it is, put it in correct_guesses and remove it from guessed_already
    # if it is not, put it in incorrect_guesses and remove it from guessed_already

    # need a display_word method - in Display class?
    # find all locations of guess in the secret word
    # call Display.display_word on the secret word

  def start
    @figure.snowman(6)
    puts get_guess
  end

end