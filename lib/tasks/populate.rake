namespace :db do
  desc "Fill the database"
  task populate: :environment do
    require "populator"
    require "faker"

    Person.populate 50 do |person|
      person.name          = Faker::Name.name
      person.date_of_birth = Faker::Date.between(90.years.ago, Date.today)
    end
  end
end
