require 'rails_helper'

RSpec.describe Item, type: :model do
	let(:item) { create(:item) }
	it { should belong_to(:list) }

	it { should validate_presence_of(:item) }
	it { should validate_presence_of(:list) }

end
