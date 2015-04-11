require 'rails_helper'

RSpec.describe "email_addresses/show", :type => :view do
  before(:each) do
    @email_address = assign(:email_address, EmailAddress.create!(
      :address => "Address",
      :econtact_id => 1,
      :econtact_type => 'Person'
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/1/)
  end
end
