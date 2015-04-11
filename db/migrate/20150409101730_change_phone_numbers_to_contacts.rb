class ChangePhoneNumbersToContacts < ActiveRecord::Migration
  def up
    PhoneNumber.destroy_all
    remove_column :phone_numbers, :person_id
    add_column :phone_numbers, :contact_id, :integer
    add_column :phone_numbers, :contact_type, :string
  end

  def down
  	PhoneNumber.destroy_all
    remove_column :phone_numbers, :contact_id
    remove_column :phone_numbers, :contact_type
    add_column :phone_numbers, :person_id, :integer
  end
end