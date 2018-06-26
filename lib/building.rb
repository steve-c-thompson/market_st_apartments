class Building
  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(apt)
    @units.push(apt)
  end

  def average_rent
    total_rent = calc_total_rent
    if(total_rent == 0)
      return total_rent
    end
    total_rent / @units.count
  end

  def total_annual_rent
    12 * calc_total_rent
  end

  def occupancy
    if(@units.count == 0)
      return 0.0
    end
    residents = @units.reduce(0) do |sum, apt|
      apt.renter ? sum + 1 : sum
    end
    (residents / @units.count.to_f) * 100 #order of ops would take care of this, but more readable
  end

  private
  def calc_total_rent
    total_rent = @units.reduce(0) { |sum, apt| sum + apt.monthly_rent }
  end
end
