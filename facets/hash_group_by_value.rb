#!/usr/bin/ruby -wKU
#
# Code Reading #5
require '../base'
require "facets/hash/group_by_value"

class Example
  def self.create
    # Servers and their OS version string
    {
      :load_balancer => '10.10',
      :web_server_one => '10.10',
      :web_server_two => '10.10',
      :app_server_one => '10.04',
      :app_server_two => '10.04',
      :database_server_one => '9.10',
      :memcached_server_one => 'sid',
      :memcached_server_two => 'sid',
      :background_server => '10.10'
    }
  end
end

ap(Example.create.group_by_value)

class HashGroupByValue < Test::Unit::TestCase
  def test_should_group_servers_by_version
    result = Example.create.group_by_value

    assert result['9.10'].include? :database_server_one

    assert result['10.04'].include? :app_server_one
    assert result['10.04'].include? :app_server_two

    assert result['10.10'].include? :background_server
    assert result['10.10'].include? :load_balancer
    assert result['10.10'].include? :web_server_one
    assert result['10.10'].include? :web_server_two

    assert result['sid'].include? :memcached_server_one
    assert result['sid'].include? :memcached_server_one
  end
  
end
