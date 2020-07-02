class Game

  def initialize
    @secret_word = ""
    @figure = Figure.new
    @unguessed_letters = [*("a".."z")]
    @correct_guesses = []
    @incorrect_guesses = []
  end

  def secret_word
    word_list = File.readlines "5desk.txt"
    word_list.map! { |word| word[0..-3] }
    word_list.delete_if { |word| word != word.downcase || word.length < 5 || word.length > 12 }
    @secret_word = word_list.sample
  end

  #check if letter has been guessed already

  #check if letter is in the secret word

  #move letter to guessed already / correct or guessed already / incorrect

  def start
    puts secret_word
    @figure.snowman
    p @unguessed_letters
  end

end