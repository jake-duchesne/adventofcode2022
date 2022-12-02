require 'byebug'

def test(input)
  pairs = input.each_slice(1)
  cleaned_pairs = []
  pairs.each do |pair|
    cleaned_pairs << pair.first.strip
  end
  # p cleaned_pairs.tally

  game_score = 0
  cleaned_pairs.each do |pair|
    case pair
    when "A X"
      game_score += 4
    when "A Y"
      game_score += 8
    when "A Z"
      game_score += 3
    when "B X"
      game_score += 1
    when "B Y"
      game_score += 5
    when "B Z"
      game_score += 9
    when "C X"
      game_score += 7
    when "C Y"
      game_score += 2
    when "C Z"
      game_score += 6
    end
  end

  p game_score
end

if __FILE__ == $0
  input = File.readlines(ARGV.first)
  test(input)
end
