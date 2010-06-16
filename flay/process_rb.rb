#!/usr/bin/ruby -wKU
#
# Code Reading #14
require '../base'
require 'ruby_parser'

SOURCE_CODE = <<EOC
class Post
  def author
    @author
  end

  def author=(name)
    @author = name
  end
end
EOC

# s(:class,
#  :Post,
#  nil,
#  s(:scope,
#   s(:block,
#    s(:defn, :author, s(:args), s(:scope, s(:block, s(:ivar, :@author)))),
#    s(:defn,
#     :author=,
#     s(:args, :name),
#     s(:scope, s(:block, s(:iasgn, :@author, s(:lvar, :name))))))))
ap RubyParser.new.process(SOURCE_CODE)

class ProcessRbTest < Test::Unit::TestCase
  def parsed
    @parsed ||= RubyParser.new.process(SOURCE_CODE)
  end
  
  def test_should_return_an_sexp
    assert_equal Sexp, parsed.class
  end

  def test_should_be_wrapped_in_a_class_named_post
    assert_equal :class, parsed.first
    assert_equal :Post, parsed[1]
  end

  def test_should_define_the_author_getter_method
    assert_equal :scope, parsed.last.first
    assert_equal :block, parsed.last.last.first # Block scope?

    author_defn = parsed.last.last.sexp_body.first
    assert_equal :defn, author_defn[0]
    assert_equal :author, author_defn[1] # Method name
    assert author_defn[2].sexp_body.empty? # Args

    assert_equal :scope, author_defn[3].sexp_type # New scope for method definition
    assert_equal :block, author_defn[3].sexp_body.first.sexp_type
    assert_equal s(:ivar, :@author), author_defn[3].sexp_body.first.sexp_body.first # Method body

  end
end

