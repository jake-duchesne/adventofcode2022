def most_calories(input)
  input.slice_when { |i, j| j == 0 }.to_a.max_by(&:sum).sum
end

def top_three_calorie_holders(input)
  input.slice_when { |i, j| j == 0 }.to_a.map(&:sum).max(3).sum
end

if __FILE__ == $0
  input = File.readlines(ARGV.first).map(&:to_i)
  puts "The elf with the highest calorie count is holding: "
  puts "#{most_calories(input)} calories"

  puts "\n"

  puts "The elves with the top three highest calorie counts are holding: "
  puts "#{top_three_calorie_holders(input)} calories"
end
