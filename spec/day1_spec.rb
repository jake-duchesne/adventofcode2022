require './day1/most_calories.rb'

RSpec.describe "number_of_calories" do
  example_file = File.readlines("spec/example_file").map(&:to_i)
  it "works for the example input" do
    num = most_calories(example_file)

    expect(num).to eq(24000)
  end
end
