@secret_word = ""

def secret_word
  word_list = File.readlines "5desk.txt"
  word_list.map! { |word| word[0..-3] }
  word_list.delete_if { |word| word != word.downcase || word.length < 5 || word.length > 12 }
  @secret_word = word_list.sample
end

puts secret_word