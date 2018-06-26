# Market Street Apartments

## Preparation

1. Fork this repository.
1. Clone your new repository to your local machine.
1. Run `bundle` from the command line.
1. Run `rake` from the command line.

## Tasks

Add code to the Apartment and Building classes to support the interaction patterns described below.

Use tests to drive your development.

### Iteration 1: Creating Apartments

In this repository we have an existing Apartment class. We're going to add to that class so that it can hold basic information about an apartment. Add to the existing Apartment class so that it supports the following interaction pattern:

```ruby
> require './lib/apartment'
# => true

> a1 = Apartment.new({number: 1, monthly_rent: 800, bathrooms: 1, bedrooms: 1})
# => #<Apartment:0x007f84b40379e8 ...>

> a1.number
# => 1

> a1.monthly_rent
# => 800

> a1.bathrooms
# => 1

> a1.bedrooms
# => 1
```

### Iteration 2: Adding Renters

Continue to add to apartments to make it so that an apartment can have a renter consistent with the interaction pattern below.

```ruby
> require './lib/apartment'
# => true

> a1 = Apartment.new({number: 1, monthly_rent: 800, bathrooms: 1, bedrooms: 1})
# => #<Apartment:0x007f84b40379e8 ...>

> a1.renter
# => nil

> require './lib/renter'
# => true

> joe = Renter.new("Joe")
# => #<Renter:0x007f84b221d188 ...>

> a1.add_renter(joe)
> a1.renter
# => #<Renter:0x007f84b221d188 ...>
```

### Iteration 3: Adding a Building

Create a Building class that allows for the following interaction pattern.

```ruby
> require './lib/building'
# => true

> building = Building.new
# => #<Building:0x007f84b21e4dd8 ...>

> building.units
# => []

> a1 = Apartment.new({number: 1, monthly_rent: 650, bedroom: 1, bathroom: 1})
# => #<Apartment:0x007f84b209c408 ...>

> building.add_unit(a1)
> building.units
# => [#<Apartment:0x007f84b209c408 ...>]

> building.units.count
# => 1

> a2 = Apartment.new({number: 1, monthly_rent: 750, bedrooms: 0, bathrooms: 1})
# => #<Apartment:0x007f84b204f720 ...>

> building.add_unit(a2)
# => [#<Apartment:0x007f84b209c408 ...>, #<Apartment:0x007f84b204f720 ...>]

> building.average_rent
# => 700

> building.total_annual_rent
# => 16800

> building.occupancy
# => 0.0

> joe = Renter.new("Joe")
# => #<Renter:0x007f84b40168b0 @name="Joe">

> a1.add_renter(joe)
> building.occupancy
# => 50.0
```

