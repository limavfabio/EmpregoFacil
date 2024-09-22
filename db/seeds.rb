admin = User.create!(
  name: "admin",
  email: "admin@admin.com",
  password: "password",
  verified: true,
  phone_number: "1234567890",
  bio: "I am the admin of this platform",
  location: "London, UK",
)

5.times do
  Post.create!(
    body: Faker::Lorem.paragraph,
    user: admin
  )
end

rand(3..8).times do
  UserSkill.create!(
    user: admin,
    skill: Skill.order("RANDOM()").first
  )
end



20.times do
  Skill.create!(name: Faker::Job.key_skill)
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

  rand(0..10).times do
    JobApplication.create!(
      user: User.order("RANDOM()").first,
      job_listing: JobListing.order("RANDOM()").first,
      # status: [ :pending, :reviewed, :accepted, :rejected ].sample,
      cover_letter: Faker::Lorem.paragraphs(number: 3).join("\n\n")
    )
  end
end

rand(1..3).times do
  Education.create!(
    user: admin,
    school: Faker::Educator.university,
    degree: Faker::Educator.degree,
    field_of_study: Faker::Educator.course,
    start_date: Faker::Date.between(from: 5.years.ago, to: 2.years.ago),
    end_date: Faker::Date.between(from: 2.years.ago, to: Date.today)
  )
end

rand(1..5).times do
  Experience.create!(
    user: admin,
    title: Faker::Job.title,
    company: Company.order("RANDOM()").first,
    start_date: Faker::Date.between(from: 5.years.ago, to: 1.year.ago),
    end_date: [ Faker::Date.between(from: 1.year.ago, to: Date.today), nil ].sample,
    current: [ true, false ].sample,
    description: Faker::Lorem.paragraph
  )
end

10.times do
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "password",
    verified: true,
    phone_number: Faker::PhoneNumber.cell_phone,
    bio: Faker::Lorem.paragraph,
    location: Faker::Address.city,
  )

  5.times do
    Post.create!(
      body: Faker::Lorem.paragraph,
      user: user
    )
  end

  rand(1..3).times do
    Education.create!(
      user: user,
      school: Faker::Educator.university,
      degree: Faker::Educator.degree,
      field_of_study: Faker::Educator.course,
      start_date: Faker::Date.between(from: 5.years.ago, to: 2.years.ago),
      end_date: Faker::Date.between(from: 2.years.ago, to: Date.today)
    )
  end

  rand(1..5).times do
    Experience.create!(
      user: user,
      title: Faker::Job.title,
      company: Company.order("RANDOM()").first,
      start_date: Faker::Date.between(from: 5.years.ago, to: 1.year.ago),
      end_date: [ Faker::Date.between(from: 1.year.ago, to: Date.today), nil ].sample,
      current: [ true, false ].sample,
      description: Faker::Lorem.paragraph
    )
  end

  rand(3..8).times do
    UserSkill.create!(
      user: user,
      skill: Skill.order("RANDOM()").first
    )
  end
end



# Create conversations and messages
20.times do
  conversation = Conversation.create!

  participants = User.order("RANDOM()").limit(rand(2..5))
  participants.each do |participant|
    ConversationParticipant.create!(
      conversation: conversation,
      user: participant
    )
  end

  rand(5..20).times do
    Message.create!(
      conversation: conversation,
      user: participants.sample,
      body: Faker::Lorem.sentence
    )
  end
end

# Create recommendations
User.all.each do |user|
  rand(0..3).times do
    recommender = User.where.not(id: user.id).order("RANDOM()").first
    Recommendation.create!(
      user: user,
      recommender: recommender,
      body: Faker::Lorem.paragraph
    )
  end
end
