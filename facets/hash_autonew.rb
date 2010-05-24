#!/usr/bin/ruby -wKU
#
# Code Reading #1
require '../base'
require 'facets/hash/autonew'

class HashAutonew
  def data
    @data = Hash.autonew
    @data['users']['eric']['blog'] = 'http://theadmin.org'
    @data
  end
end

ap(HashAutonew.new.data)

class HashAutonewTest < Test::Unit::TestCase
  def test_should_nest_values_automatically
    hashish = HashAutonew.new.data

    assert hashish.key?('users')
    assert hashish['users'].key?('eric')
    assert hashish['users']['eric'].key?('blog')
    assert_equal 'http://theadmin.org', hashish['users']['eric']['blog']
  end
  
end
