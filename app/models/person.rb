class Person < ApplicationRecord
  has_many :addresses
  has_one :profile
  belongs_to :user
end
