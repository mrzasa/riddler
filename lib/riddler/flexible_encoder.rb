module Riddler
  class FlexibleEncoder
    def initialize
      @code_book = {}
    end

    def add(what)
      what.each do |digit, values|
        values = [ values ] unless values.is_a? Array
        @code_book[digit] ||= []
        @code_book[digit].concat values
      end
    end

    def encode(digit)
      dispatch @code_book[digit], digit
    end

    private

    def dispatch(descriptions, digit)
      item = descriptions.sample
      if item.is_a? Proc
        return item.call digit
      end
      return item
    end
  end
end
