class Apartment
  attr_reader :number
  attr_reader :monthly_rent
  attr_reader :bedrooms
  attr_reader :bathrooms

  def initialize(data)
    @number = data[:number]
    @monthly_rent = data[:monthly_rent]
    @bedrooms = data[:bedrooms]
    @bathrooms = data[:bathrooms]
  end
end
