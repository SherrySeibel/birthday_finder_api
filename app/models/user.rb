class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates_format_of :email, with: /.+@.+\..+/i, on: :create
end
