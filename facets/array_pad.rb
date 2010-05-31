#!/usr/bin/ruby -wKU
#
# Code Reading #6
require '../base'
require "facets/array/pad"

class Example
  def self.create
    last_ten_transactions = [
                             52.25,
                             100.25,
                             0.45
                            ]
    last_ten_transactions.pad(10, 0)
  end
end

ap Example.create

class ArrayPadTest < Test::Unit::TestCase
  def test_should_pad_the_array_to_10_elements
    result = Example.create
    
    assert_equal 10, result.length
  end

  def test_should_pad_to_the_end_of_the_array
    result = Example.create

    assert_equal [
                  52.25,
                  100.25,
                  0.45,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0
                 ], result
  end
end
