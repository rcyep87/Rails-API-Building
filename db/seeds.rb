# Create 15 users
# 15 unique addresses
# 25 unique items
# constraint of 1-25 item_id for Order
# constraint of 1-15 user_id for Order

15.times do
  user = User.create({
      first_name: Faker::Name.first_name,
       last_name: Faker::Name.last_name,
             age: Faker::Number.between(15, 45) })

  Address.create({
         user_id: user.id,
     street_name: Faker::Address.street_name,
            city: Faker::Address.city,
           state: Faker::Address.state,
             zip: Faker::Address.zip })
end

25.times do
  item = Item.create({
              name: Faker::Team.creature,
             price: rand(100000),
       description: Faker::Team.creature })

  Order.create({
           item_id: item.id,
           user_id: Faker::Number.between(1, 15),
          quantity: rand(1000) })
end



