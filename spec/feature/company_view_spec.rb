require 'rails_helper'

describe 'the company view', type: :feature do
	let(:company) { Company.create(name: 'comp5') }
  
  describe 'PhoneNumber' do
    before(:each) do
      company.phone_numbers.create(number: "555-1234")
      company.phone_numbers.create(number: "555-5678")
      visit company_path(company)
    end
  
    it 'shows the phone numbers' do
      company.phone_numbers.each do |phone|
      	expect(page).to have_content(phone.number)
      end
    end
  
    it 'has a link to add new phone number' do
    	expect(page).to have_link('Add phone number', href: new_phone_number_path(contact_id: company.id, contact_type: 'Company'))
    end
  
    it 'adds a new phone number' do
    	page.click_link('Add phone number')
    	page.fill_in('Number', with: '555-8888')
    	page.click_button('Create Phone number')
    	expect(current_path).to eq(company_path(company))
    	expect(page).to have_content('555-8888')
    end
  
    it 'has links to edit phone numbers' do
    	company.phone_numbers.each do |phone|
    		expect(page).to  have_link('edit', href: edit_phone_number_path(phone))
    	end
    end
  
    it 'edits a phone number' do
    	phone = company.phone_numbers.first
    	old_number = phone.number
  
    	first(:link, 'edit').click()
    	page.fill_in('Number', with: '555-9191')
    	page.click_button('Update Phone number')
    	expect(current_path).to eq(company_path(company))
    	expect(page).to have_content()
    	expect(page).not_to have_content(old_number)
    end
  
    it 'delete a phone number' do
    	phone = company.phone_numbers.first
    	old_number = phone.number
    	first(:link, 'delete').click()  	
    	expect(current_path).to eq(company_path(company))
    	expect(page).not_to have_content(old_number)
    end
  end

  describe 'EmailAddress' do
    before(:each) do
      company.email_addresses.create(address: "sublime@gmail.com")
      company.email_addresses.create(address: "sublime1@gmail.com")
      visit company_path(company)
    end
    
    it 'shows the email address' do
      company.email_addresses.each do |email|
        expect(page).to have_content(email.address)
      end
    end
    
    it 'has an add email address link' do
      expect(page).to have_link('Add Email Address', href: new_email_address_path(contact_id: company.id, contact_type: 'Company'))
    end
    
    it 'adds new email address' do
      page.click_link('Add Email Address')
      page.fill_in('Address', with: 'm@c@gmail.com')
      page.click_button('Create Email address')
        expect(current_path).to eq(company_path(company))
        expect(page).to have_content('m@c@gmail.com')
    end
  end

end