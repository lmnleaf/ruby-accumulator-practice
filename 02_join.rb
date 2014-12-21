# Write code that will join every element in an array by a given delimiter
# Then make it so that if you don't pass a delimiter, it just concatenates them all together
#
# You can only use the `#each` method on the input array

def join(array, string = "")

  result = ""

  item_and_string = []

  array.each do |item|
    item_and_string ||= []
    item_and_string << item + string
  end

  item_and_string

  item_and_string.each do |i_a_s|
     result = result + i_a_s
  end

  if string != ""
    result = result.chop
  else
    result
  end

end

# could combine the two each methods above like this:
# array.each do |item|
#   result += item + string
# end

# instead of each could use flat_map
# item_and_string = array.flat_map do |item|
#  item + string
# end

require 'rspec'
require 'rspec/autorun'

RSpec.describe '#join' do

  it 'returns an empty string when given an empty array' do
    actual = join([], "|")

    expect(actual).to eq("")
  end

  it 'joins the elements in the array into a string, separated by the delimiter' do
    actual = join(["a", "b", "c"], "|")

    expect(actual).to eq("a|b|c")
  end

  it 'returns a string with all elements joined even when you do not pass a delimiter' do
    actual = join(["a", "b", "c"])

    expect(actual).to eq("abc")
  end

end
