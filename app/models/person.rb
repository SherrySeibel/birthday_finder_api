class Person < ActiveRecord::Base
  validates :name, presence: true, null: false
  validates :date_of_birth, presence: true, null: false
end
