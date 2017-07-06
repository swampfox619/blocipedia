require 'random_data'

# Create Wikis

        User.create!(
        email: 'standard@example.com',
        password: 'password',
        created_at: DateTime.now,
        confirmed_at: DateTime.now,
        role: 0
    )
    
        User.create!(
        email: 'premium@example.com',
        password: 'password',
        created_at: DateTime.now,
        confirmed_at: DateTime.now,
        role: 1
    )
    
        User.create!(
        email: 'admin@example.com',
        password: 'password',
        created_at: DateTime.now,
        confirmed_at: DateTime.now,
        role: 2
    )
    10.times do
        User.create!(
            email: Faker::Internet.unique.email,
            password: 'password',
            confirmed_at: DateTime.now,
            role: rand(0..2)
            )
    end
    
    50.times do
    
        Wiki.create!(
         title:  Faker::Lorem.unique.sentence,
         body:   Faker::Lorem.unique.paragraph,
         user_id: rand(1..13),
         created_at: Faker::Date.unique.between(1.year.ago, DateTime.now)
        )
    end
    
    
    wikis = Wiki.all
    
    puts "Seed finished"
    puts "#{Wiki.count} wikis created"
    puts "#{User.count} user(s) created"
