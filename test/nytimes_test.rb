require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/nytimes'

class NytimesTest < Minitest::Test
  attr_reader :hash

  def setup
    @hash = Nytimes::DATA
  end

  def test_it_can_get_copyright
    #Set your code to the local variable, "result"
    result = @hash[:copyright]

    assert result, "Copyright (c) 2018 The New York Times Company. All Rights Reserved."
  end

  def test_it_can_get_array_of_stories
    #Set your code to the local variable, "result"

    result = @hash[:results]

    assert result.is_a? (Array)
    assert_equal 44, result.count
  end

  def test_it_can_get_all_stories_with_subsection_of_politics

    # result (an array result.last[:title]) result last = hash

    # @data = Nytimes::DATA

    result = @hash[:results].filter_map { |element| element if element[:subsection] == "Politics" }
    # an array of hashes
    #Set your code to the local variable, "result"


    # results where section is US
    # subsection is politics


    assert result.is_a? (Array)
    assert_equal 6, result.count
    assert_equal "Congressional G.O.P. Agenda Quietly Falls Into Place Even as Trump Steals the Spotlight",
      result.first[:title]
    assert_equal "Conspiracy Theories Made Alex Jones Very Rich. They May Bring Him Down.",
      result.last[:title]
  end
  #
  # test = NytimesTest.new
  # test.setup


end
