p "Destroy all Addresses"
Address.destroy_all

places = [
  {
    name: 'sandy',
    zips: [84092, 84093, 84094, 84070],
    lat: 40.564978,
    lon: -111.838973
  },
  {
    name: 'midvale',
    zips: [84047],
    lat: 40.611057,
    lon: -111.899933
  },
  {
    name: 'millcreek',
    zips: [84109, 84124],
    lat: 40.686891,
    lon: -111.875491
  }
]

# POSTGIS STRUCTURE
300000.times do |index|
  place = places.sample
  Address.create!(
    street1: Faker::Address.street_address,
    street2: Faker::Address.secondary_address,
    city: place[:name],
    state: 'UT',
    zip: place[:zips].sample,
    lonlat: "POINT(#{place[:lon]} #{place[:lat]})"
  )
end
p "Created #{Address.count} addresses"