

1.times{
  user = User.create( account: "admin123", password: 123456 )
  100.times{
    p "------------------------"
    title = Faker::Artist.name
    content = Faker::Lorem.paragraph_by_chars(256, false)
    start_time = Faker::Time.between(2.days.ago, Date.today, :all)
    end_time = Faker::Time.between(1.days.ago, Date.today, :all)
    Mission.create(user_id: user.id, title: title, content: content, start_time: start_time, end_time: end_time, status: rand(0..2) )
  }
}