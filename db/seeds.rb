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
  User.create!(generate_data(i))
end
