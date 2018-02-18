class Person < ApplicationRecord
  has_many :addresses
  has_one :profile
  validates_presence_of :name, :date_of_birth, :phone_number

end
