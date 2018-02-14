class Address < ApplicationRecord
  belongs_to :person
  # validates_presence_of :country, :city, :person_id
end
