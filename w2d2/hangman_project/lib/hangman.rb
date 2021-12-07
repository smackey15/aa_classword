require "byebug"
class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_") #["_", "_", "_"]
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    array = []
    @secret_word.each_char.with_index {|ele, i| array << i if ele == char}
    array
  end

  def fill_indices(char, array)
    array.each do |i|
      @guess_word[i] = char
    end
  end

  def try_guess(char) #x
    if already_attempted?(char)
      p 'that has already been attempted'
      false
    else
      @attempted_chars << char

    if get_matching_indices(char).length > 0
        fill_indices(char, get_matching_indices(char))
      else
        @remaining_incorrect_guesses -= 1
      end
    true
    end
  end

  def ask_user_for_guess
    p "Enter a char"
    char = gets.chomp
    try_guess(char)
  end

  def win?
    if @guess_word.join == @secret_word
      p "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p "LOSE"
      return true
    end
    if @remaining_incorrect_guesses > 0
      return false 
    end
  end

  def game_over?
    if win? || lose?
      p @secret_word
      return true
    else
      return false
    end
  end

end
