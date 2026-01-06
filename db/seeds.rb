def generate_data(i)
  {
    name:  "Example User #{i+1}",
    email: "example#{i+1}@railstutorial.org",
    password:              "foobar",
    password_confirmation: "foobar",
    admin: true,
    activated: true,              # <--- Add this
    activated_at: Time.zone.now
  }
end

User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,              # <--- Add this
             activated_at: Time.zone.now)  # <--- Add this

(0..19).each do |i |
  puts User.create!(generate_data(i)).to_s
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| puts user.microposts.create!(content: content).to_s }
end

# ... users and microposts ...

# Create following relationships.
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }



