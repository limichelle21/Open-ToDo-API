class Item < ActiveRecord::Base
	
	belongs_to :list

	validates :item, presence: :true
	validates :completed, :inclusion => {:in => [true, false]}
	validates :list, presence: :true

end
