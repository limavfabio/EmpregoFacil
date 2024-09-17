user = User.create!(
  name: "admin",
  email: "admin@admin.com",
  password: "password"
)

5.times do
  Post.create!(
    body: Faker::Lorem.paragraph,
    user: user
  )
end

10.times do
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "password"
  )

  5.times do
    Post.create!(
      body: Faker::Lorem.paragraph,
      user: user
    )
  end
end

5.times do
  company = Company.create!(
    name: Faker::Company.name,
  )

  5.times do
    JobListing.create!(
      title: Faker::Job.title,
      description: Faker::Lorem.paragraphs.join,
      company: company
    )
  end
end
