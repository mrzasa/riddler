require "riddler/version"
require "riddler/flexible_encoder"

module Riddler
  class Riddler
    attr_reader :encoder

    def initialize(encoder = Encoder.new)
      @encoder = encoder
    end

    def encode(number)
      digitalize(number).map { |digit| encoder.encode(digit) }
    end

    def digitalize(number)
      number.chars.map(&:to_i)
    end
  end

  class Encoder
    CODE_BOOK = {
      '0' => "nothing at all",
      '1' => "first digit of year of Grunwald battle",
      '2' => "first digit of e number",
      '3' => 'first digit of pi number',
      '4' => 'number of strings in a fiddle',
      '5' => 'current major version of Rails',
      '6' => '2*3',
      '7' => '...years in Tibet',
      '8' => '2**3',
      '9' => 'number of fields in tic-tac-toe',
    }

    def encode(digit)
      CODE_BOOK[digit.to_s]
    end
  end
end
