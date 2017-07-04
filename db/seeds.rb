require 'random_data'

# Create Wikis
    50.times do
    
        Wiki.create!(
         title:  RandomData.random_sentence,
         body:   RandomData.random_paragraph
        )
    
    end

    User.create!(
        id: 1,
        email: 'lewisvine78@yahoo.com',
        password: 'parkview',
        created_at: DateTime.now,
        confirmed_at: DateTime.now
    )
    
    wikis = Wiki.all
    
    puts "Seed finished"
    puts "#{Wiki.count} wikis created"
    puts "#{User.count} user(s) created"
