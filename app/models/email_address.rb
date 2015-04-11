class EmailAddress < ActiveRecord::Base
    belongs_to :econtact, polymorphic: true
    validates :address, :econtact_id, presence: true    
end
