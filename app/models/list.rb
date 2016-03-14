class List < ActiveRecord::Base

	belongs_to :user
	has_many :items

	validates :title, presence: :true 
	validates :user, presence: :true
	validates :public, inclusion: { in: [true, false], message: "%{value} is not a valid permission." }
	
end
