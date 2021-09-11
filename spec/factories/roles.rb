FactoryBot.define do
  factory :role do
    user
    name { Faker::Name.first_name }
    job { Faker::Job.title }
    age { rand(5..130)}
  end
end