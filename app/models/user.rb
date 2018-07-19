class User < ApplicationRecord
	has_secure_password

	enum role:[:user, :admin]

	# Verify that email field is not blank and that it doesn't already exist in the db (prevents duplicates):
	validates :email, presence: true, uniqueness: true

	has_many :tasks
end