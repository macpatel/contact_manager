class ChangeEmailAddressToContact < ActiveRecord::Migration
  def up
    EmailAddress.destroy_all
    remove_column :email_addresses, :person_id
    add_column :email_addresses, :contact_id, :integer
    add_column :email_addresses, :contact_type, :string
  end

  def down
  	EmailAddress.destroy_all
    remove_column :email_addresses, :contact_id
    remove_column :email_addresses, :contact_type
    add_column :email_addresses, :person_id, :integer
  end
end
