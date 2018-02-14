class Profile < ApplicationRecord
  belongs_to :person
  # validates_presence_of :first_name, :last_name, :gender, :email, :active
end
