#!/usr/bin/ruby -wKU
#
# Code Reading #4
require '../base'
require "facets/hash/merge"

class Example
  def self.create
    {
      :users => [:edavis],
      :servers => [:app1, :app2, :app3]
    }
  end
end

ap(Example.create.reverse_merge({
                                  :shell => '/bin/bash',
                                  :users => [:rails]
                                }))

class HashReverseMerge < Test::Unit::TestCase
  def test_should_combine_hashes
    @example = Example.create.reverse_merge({:shell => '/bin/bash'})
    
    assert_equal '/bin/bash', @example[:shell]
    assert_equal [:edavis], @example[:users]
  end

  def test_should_let_the_caller_win
    @example = Example.create.reverse_merge({
                                              :shell => '/bin/bash',
                                              :users => [:rails]
                                            })
    
    assert_equal '/bin/bash', @example[:shell]
    assert_equal [:edavis], @example[:users]
  end
end
