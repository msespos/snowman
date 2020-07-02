class Board

  def initialize
    @secret_word = []
    @figure = Figure.new
  end

  def secret_word_array(secret_word)
    @secret_word = secret_word.chars
    p @secret_word
  end

end