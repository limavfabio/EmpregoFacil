# Create first User
User.create!(
  name: "Admin",
  email: "admin@admin.com",
  password: "password",
)

Company.create!(
  name: "Emprego Facil"
)

JobListing.create!(
  title: "Junior Full Stack Developer",
  description: "Junior Full Stack Developer",
  company: Company.first
)
