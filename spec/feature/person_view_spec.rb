require 'rails_helper'

describe 'the person view', type: :feature do

  let(:person) { Person.create(first_name: 'John', last_name: 'Doe') }
  
  describe 'PhoneNumber' do
    before(:each) do
      person.phone_numbers.create(number: "555-1234")
      person.phone_numbers.create(number: "555-5678")
      visit person_path(person)
    end
  
    it 'shows the phone numbers' do
      person.phone_numbers.each do |phone|
        expect(page).to have_content(phone.number)
      end
    end
  
    it 'has a link to add new phone number' do
    	expect(page).to have_link('Add phone number', href: new_phone_number_path(contact_id: person.id, contact_type: 'Person'))
    end
  
    it 'adds a new phone number' do
    	page.click_link('Add phone number')
    	page.fill_in('Number', with: '555-8888')
    	page.click_button('Create Phone number')
    	expect(current_path).to eq(person_path(person))
    	expect(page).to have_content('555-8888')
    end
  
    it 'has links to edit phone numbers' do
    	person.phone_numbers.each do |phone|
    		expect(page).to  have_link('edit', href: edit_phone_number_path(phone))
    	end
    end
  
    it 'edits a phone number' do
    	phone = person.phone_numbers.first
    	old_number = phone.number
  
    	first(:link, 'edit').click()
    	page.fill_in('Number', with: '555-9191')
    	page.click_button('Update Phone number')
    	expect(current_path).to eq(person_path(person))
    	expect(page).to have_content()
    	expect(page).not_to have_content(old_number)
    end
  
    it 'delete a phone number' do
    	phone = person.phone_numbers.first
    	old_number = phone.number
    	first(:link, 'delete').click()  	
    	expect(current_path).to eq(person_path(person))
    	expect(page).not_to have_content(old_number)
    end
  end
  
  describe 'EmailAddress' do
    before(:each) do
      person.email_addresses.create(address: "sublime@gmail.com")
      person.email_addresses.create(address: "sublime1@gmail.com")
      visit person_path(person)
    end
    
    it 'shows the email address' do
      person.email_addresses.each do |email|
        expect(page).to have_content(email.address)
      end
    end
    
    it 'has an add email address link' do
      expect(page).to have_link('Add Email Address', href: new_email_address_path(econtact_id: person.id, econtact_type: 'Person'))
    end
    
    it 'adds new email address' do
      page.click_link('Add Email Address')
      page.fill_in('Address', with: 'm@c@gmail.com')
      page.click_button('Create Email address')
    	expect(current_path).to eq(person_path(person))
    	expect(page).to have_content('m@c@gmail.com')
    end
  end


end