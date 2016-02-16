require 'rails_helper'

RSpec.describe List, type: :model do

	let(:list) { create(:list) }
	it { should belong_to(:user) }


	it { should validate_presence_of(:title) }
end
