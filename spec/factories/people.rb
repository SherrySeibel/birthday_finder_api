FactoryGirl.define do
  factory :person do
    name { Faker::Name.name }
    date_of_birth { Faker::Date.between(95.years.ago, Date.today) }
  end
end
