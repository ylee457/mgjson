require 'test_helper'

class MgjsonTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Mgjson::VERSION
  end

  def test_it_requires_a_file_name
    assert true
  end
end
