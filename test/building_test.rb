require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/building'

class BuildingTest < Minitest::Test
  def test_it_exists
    building = Building.new
    assert_instance_of Building, building
    assert_instance_of Array, building.units
    assert_equal 0, building.units.count
  end

  def test_it_can_add_apartments
    building = Building.new
    a1 = Apartment.new({number: 1, monthly_rent: 650, bedroom: 1, bathroom: 1})
    building.add_unit(a1)
    assert_equal 1, building.units.count
    assert_equal 1, building.units[0].number
  end

  def test_it_can_calculate_average_rent
    building = Building.new
    a1 = Apartment.new({number: 1, monthly_rent: 650, bedroom: 1, bathroom: 1})
    building.add_unit(a1)
    a2 = Apartment.new({number: 1, monthly_rent: 750, bedrooms: 0, bathrooms: 1})
    building.add_unit(a2)

    assert_equal 700, building.average_rent
  end

  def test_it_can_calculate_average_rent_for_no_units_returning_zero
    building = Building.new
    assert_equal 0, building.average_rent
  end

  def test_total_annual_rent_returns_total_rent_mult_12
    building = Building.new
    a1 = Apartment.new({number: 1, monthly_rent: 650, bedroom: 1, bathroom: 1})
    building.add_unit(a1)
    a2 = Apartment.new({number: 1, monthly_rent: 750, bedrooms: 0, bathrooms: 1})
    building.add_unit(a2)

    assert_equal 16800, building.total_annual_rent
  end

  def test_occupancy_returns_0_for_empty_building
    building = Building.new
    assert_equal 0.0, building.occupancy
  end

  def test_occupancy_returns_percentage_of_renters_divided_by_apartments
      building = Building.new
      a1 = Apartment.new({number: 1, monthly_rent: 650, bedroom: 1, bathroom: 1})
      building.add_unit(a1)
      a2 = Apartment.new({number: 1, monthly_rent: 750, bedrooms: 0, bathrooms: 1})
      building.add_unit(a2)
      assert_equal 0.0, building.occupancy
      joe = Renter.new("Joe")
      a1.add_renter(joe)
      assert_equal 50.0, building.occupancy
  end
end
