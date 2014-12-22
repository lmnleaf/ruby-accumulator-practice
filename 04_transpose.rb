# Write code that can transpose an array of arrays into another array of arrays
#
# You can use any methods you like on the input array except `#transpose`
#
# def transpose(inputs)
#
#   result = []
#
#   count = inputs.length
#
#   while count > 0 do
#
#     array = inputs.flatten
#     first_item = array.first
#     smaller_array = array.select { |a| a == first_item }
#     result << smaller_array
#     inputs = array.reject { |a| a == first_item }
#     count = inputs.length
#
#   end
#
#   p result
#
# end


def transpose(inputs)

  result = []

  if inputs != []

    count = inputs.first.length

    while count > 0 do

      smaller_array = []

      inputs.each do |input|
        smaller_array << input[count-1]
      end

      result << smaller_array
      count = count - 1

    end

  end

  result.reverse

end



require 'rspec'
require 'rspec/autorun'

RSpec.describe '#transpose' do

  it 'returns an empty array when given an empty array' do
    actual = transpose([])

    expect(actual).to eq([])
  end

  it 'returns arrays that contain the same thing' do
    input = [
      ['top', 'middle', 'bottom'],
      ['top', 'middle', 'bottom'],
      ['top', 'middle', 'bottom']
    ]
    expected = [
      ['top', 'top', 'top'],
      ['middle', 'middle', 'middle'],
      ['bottom', 'bottom', 'bottom']
    ]
    actual = transpose(input)

    expect(actual).to eq(expected)
  end

end
