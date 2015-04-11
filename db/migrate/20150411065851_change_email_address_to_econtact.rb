class ChangeEmailAddressToEcontact < ActiveRecord::Migration
  def up
    EmailAddress.destroy_all
    remove_column :email_addresses, :person_id
    add_column :email_addresses, :econtact_id, :integer
    add_column :email_addresses, :econtact_type, :string
  end

  def down
  	EmailAddress.destroy_all
    remove_column :email_addresses, :econtact_id
    remove_column :email_addresses, :econtact_type
    add_column :email_addresses, :person_id, :integer
  end
end
