#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'minitest/reporters'
require 'minitest/autorun'
require 'minitest/reporters'
require 'sports_schedule'

MiniTest::Reporters.use!

class TestSportsSchedule < Minitest::Unit::TestCase
  def setup
    @r = Class.new{ include SportsSchedule::Rugby }.new
  end

  def test_parse
    assert_equal(true, @r.parse(2012, 11))
  end
end
