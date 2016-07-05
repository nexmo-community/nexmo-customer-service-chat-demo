# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |j|
  number = "447555555#{rand(100..999)}"

  10.times do |i|
    Message.create!(
      number: number,
      text: Faker::Hipster.paragraph(1),
      inbound: Faker::Boolean.boolean,
      created_at: (i+j).hours.ago
    )
  end
end
