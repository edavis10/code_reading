#!/usr/bin/ruby -wKU
#
# Code Reading #2
require '../base'
require "facets/hash/zipnew"

# Alternative implementation
class Hash
  def self.alt_zipnew(keys, values)
    h = {}
    keys.each_with_index {|key, index| h[ key ] = values[ index ] }
    h
  end
end


class HashZipnew
  def data
    keys = [
            '2010-05-15',
            '2010-05-16',
            '2010-05-17',
            '2010-05-18',
            '2010-05-19'
            ]
    values = [
              100.0,
              450.5,
              89.0,
              0.0,
              78.5
             ]
    Hash.zipnew(keys, values)
  end

  def alternative_implementation
    keys = [
            '2010-05-15',
            '2010-05-16',
            '2010-05-17',
            '2010-05-18',
            '2010-05-19'
            ]
    values = [
              100.0,
              450.5,
              89.0,
              0.0,
              78.5
             ]
    Hash.alt_zipnew(keys, values)
  end
end

ap(HashZipnew.new.data)
ap(HashZipnew.new.alternative_implementation)

class HashZipnewTest < Test::Unit::TestCase
  def test_use_the_arrays_to_map_keys_to_values
    hashish = HashZipnew.new.data

    assert_equal 100.0, hashish['2010-05-15']
    assert_equal 450.5, hashish['2010-05-16']
    assert_equal  89.0, hashish['2010-05-17']
    assert_equal   0.0, hashish['2010-05-18']
    assert_equal  78.5, hashish['2010-05-19']
  end

  def test_alternative_implementation
    hashish = HashZipnew.new.alternative_implementation

    assert_equal 100.0, hashish['2010-05-15']
    assert_equal 450.5, hashish['2010-05-16']
    assert_equal  89.0, hashish['2010-05-17']
    assert_equal   0.0, hashish['2010-05-18']
    assert_equal  78.5, hashish['2010-05-19']
  end
end
