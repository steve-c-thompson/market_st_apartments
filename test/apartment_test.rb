require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require './lib/apartment'

class ApartmentTest < Minitest::Test
  def test_it_exists_with_readers
    apartment = Apartment.new({number: 1, monthly_rent: 800, bathrooms: 2, bedrooms: 3})
    assert_instance_of Apartment, apartment
    assert_equal 1, apartment.number
    assert_equal 800, apartment.monthly_rent
    assert_equal 2, apartment.bathrooms
    assert_equal 3, apartment.bedrooms
  end

  def test_it_can_add_renters
    a1 = Apartment.new({number: 1, monthly_rent: 800, bathrooms: 1, bedrooms: 1})
    assert_nil a1.renter

    joe = Renter.new("Joe")
    a1.add_renter(joe)

    refute_nil a1.renter
    assert_equal "Joe", a1.renter.name
  end
end
