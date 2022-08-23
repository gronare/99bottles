class Bottles
  def verse(number)
    @bottles = number
    part_one + part_two
  end

  def verses(start, finish)
    string = ""
    start.downto(finish) do |number|
      string += verse(number)
      string += "\n" unless number == finish
    end

    string
  end

  def song
    verses(99, 0)
  end

  private

  def part_one
    "#{count(true)} #{pluralize('bottle')} of beer on the wall, " +
      "#{count(false)} #{pluralize('bottle')} of beer.\n"
  end

  def part_two
    fetch_beer + remaining
  end

  def count(capitalize)
    return "No more" if @bottles == 0 && capitalize
    return "no more" if @bottles == 0 && !capitalize

    @bottles
  end

  def pluralize(text)
    return text + "s" if @bottles != 1

    text
  end

  def bottles_left
    "#{count(false)} #{pluralize('bottle')} of beer on the wall.\n"
  end

  def fetch_beer
    return "Go to the store and buy some more, " if @bottles == 0

    "Take #{@bottles == 1 ? 'it' : 'one'} down and pass it around, "
  end

  def remaining
    @bottles != 0 ? @bottles -= 1 : @bottles = 99
    bottles_left
  end
end