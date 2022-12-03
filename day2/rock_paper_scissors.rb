require 'byebug'

def high_score(input)
  pairs = input.each_slice(1)
  cleaned_pairs = []
  pairs.each do |pair|
    cleaned_pairs << pair.first.strip
  end
  # p cleaned_pairs.tally
  # could maybe shorten this by doing tally * score of game and predefine

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

  puts "If everything goes correctly, you'll score #{game_score} points"
end




def secret_to_winning(input)
  # we know the opponent input A (rock), B (paper), C (scissors)
  # we know the outcome must be X (lose), Y (tie), Z (win)
  # if A and Y, pick rock to tie
  # if A and Z, pick paper to win
  

  pairs = input.each_slice(1)
  cleaned_pairs = []
  pairs.each do |pair|
    cleaned_pairs << pair.first.strip
  end

  game_score = 0
  cleaned_pairs.each do |pair|
    pair.split
    game_score += pick_hand(pair.split.first, pair.split.last)
  end
  p game_score
end

def pick_hand(opp, res)
  rock_dictionary = { win: :paper, lose: :scissors, tie: :rock }

  paper_dictionary = { win: :scissors, lose: :rock, tie: :paper }

  scissors_dictionary =  { win: :rock, lose: :paper, tie: :scissors }

  if opp === "A"
    score = 0
    result = resolve_result(res)
    pick = rock_dictionary[result]
    score += score_result(result)
    score += score_pick(pick)
    score
  elsif opp == "B"
    score = 0
    result = resolve_result(res)
    pick = paper_dictionary[result]
    score += score_result(result)
    score += score_pick(pick)
    score
  elsif opp == "C"
    score = 0
    result = resolve_result(res)
    pick = scissors_dictionary[result]
    score += score_result(result)
    score += score_pick(pick)
    score
  end
end

def resolve_result(res)
  if res == "X"
    :lose
  elsif res == "Y"
    :tie
  elsif res == "Z"
    :win
  end
end

def score_pick(hand)
  if hand == :rock
    1
  elsif hand == :paper
    2
  elsif hand == :scissors
    3
  end
end

def score_result(result)
  if result == :win
    6
  elsif result == :tie
    3
  elsif result == :lose
    0
  end
end



if __FILE__ == $0
  input = File.readlines(ARGV.first)
  high_score(input)
  secret_to_winning(input)
end
