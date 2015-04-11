require 'rails_helper'

RSpec.describe Company, :type => :model do
  let(:company) do
		Company.new(name: 'company1', contact_id: 1, contact_type: 'Person')
	end

	it 'is valid' do
		expect(company).to be_valid
	end
end
