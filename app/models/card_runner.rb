require './app/models/card.rb'
class CardRunner < ApplicationRecord
  def self.start(answer)
    if %[q quit].split.include?(answer)
      quit
    elsif valid_input?(answer)
      check_validity(answer)
    else
      invalid_input(answer)
    end
  end

  def self.quit
    puts 'Thanks!! See you soon.'
    abort
  end

  def self.valid_input?(answer)
    answer.chars - %[1 2 3 4 5 6 7 8 9 0].split == [] &&
    (answer.length == 15 || answer.length == 16)
  end

  def self.check_validity(answer)
    valid?(answer)
  end

  def self.invalid_input(answer)
    return "Sorry...The Input: '#{answer}' was Invalid"
  end


  def self.split(answer)
    answer.delete(' ').to_i.digits
  end

  def self.multiply(answer)
    split(answer).map.with_index do |num, index|
      if index.odd?
        num*2
      else
        num
      end
    end
  end


  def self.subtract(answer)
    multiply(answer).map do |num|
      if num >9
        num-9
      else
        num
      end
    end
  end

  def self.sum(answer)
    subtract(answer).sum
  end

  def self.valid?(answer)
    if (sum(answer) % 10).zero?
      return "Card Number : '#{answer}' was Valid."
    else
      return "Sorry the Card Number : '#{answer}' was Invalid."
    end
  end

end
