#!/usr/bin/ruby -wKU
#
# Code Reading #3
require '../base'
require 'facets/hash/to_struct'

class Example
  def self.create
    {
      :users => [:edavis],
      :servers => [:app1, :app2, :app3]
    }.to_struct("Application")
  end
end

ap(Example.create)

class HashToStruct < Test::Unit::TestCase
  def test_should_be_a_struct
    assert_kind_of Struct, Example.create
  end

  def test_should_set_users
    @example = Example.create
    assert_equal [:edavis], @example.users
  end
  
  def test_should_set_servers
    @example = Example.create
    assert_equal [:app1, :app2, :app3], @example.servers
  end
  
end
