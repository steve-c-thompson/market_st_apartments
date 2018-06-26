require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/renter'

class RenterTest < Minitest::Test
  def test_it_exists
    sal = Renter.new("Sal")

    assert_instance_of Renter, sal
  end

  def test_it_has_a_name
    sal = Renter.new("Sal")

    assert_equal "Sal", sal.name
  end
end
