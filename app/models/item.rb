class Item < ActiveRecord::Base
	
	belongs_to :list
	belongs_to :user

	validates :item, presence: :true
	validates :completed, :inclusion => {:in => [true, false]}
	validates :list, presence: :true
	validates :user, presence: :true

end
