FactoryBot.define do
  factory :role do
    user
    name { Faker::Name.first_name }
    job { Faker::Job.title }
    age { rand(5..130)}
    power {5}
    attack_power {nil}
    really_attack_power {nil}
    sword_dps {nil}

    after :create do |role|
      create_list :sword, 3, role: role
    end
  end
end