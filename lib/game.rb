# encoding: utf-8

class Game
  attr_reader :errors, :letters, :good_letters, :bad_letters, :status

  attr_accessor :version

  MAX_ERRORS = 7

  def initialize(word)
    @letters = get_letters(word)
    @errors = 0
    @good_letters = []
    @bad_letters = []
    @status = :in_progress # or – :won, :lost
  end

  def get_letters(word)
    if word.nil? || word == ''
      abort 'Вы не ввели слово для игры...'
    else
      word = word.encode('UTF-8')
    end

    UnicodeUtils.upcase(word).split('')
  end

  def max_errors
    MAX_ERRORS
  end

  def errors_left
    MAX_ERRORS - @errors
  end

  def good?(letter)
    @letters.include?(letter) ||
        (letter == 'Е' && @letters.include?('Ё')) ||
        (letter == 'Ё' && @letters.include?('Е'))
  end

  def add_letter_to(letters, letter)
    letters << letter

    case letter
    when 'Е' then
      letters << 'Ё'
    when 'Ё' then
      letters << 'Е'
    end
  end

  def solved?
    (@letters - @good_letters).empty?
  end

  def repeated?(letter)
    @good_letters.include?(letter) || @bad_letters.include?(letter)
  end

  def lost?
    @status == :lost || @errors >= MAX_ERRORS
  end

  def in_progress?
    @status == :in_progress
  end

  def won?
    @status == :won
  end

  def next_step(letter)
    letter = UnicodeUtils.upcase(letter)
    return if @status == :lost || @status == :won
    return if repeated?(letter)

    if good?(letter)
      add_letter_to(@good_letters, letter)
      @status = :won if solved?
    else
      add_letter_to(@bad_letters, letter)
      @errors += 1
      @status = :lost if lost?
    end
  end

  def ask_next_letter
    puts "\nВведите следующую букву"
    letter = ''
    letter = STDIN.gets.encode("UTF-8").chomp while letter == ''
    next_step(letter)
  end
end
