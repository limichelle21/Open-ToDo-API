class User < ActiveRecord::Base
	has_many :lists

	validates :name, presence: true
	validates :email, presence: true
	validates :password_digest, presence: true

end
