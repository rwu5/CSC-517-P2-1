class University < ApplicationRecord
  validates :name, presence: true
  has_many :libraries
  has_many :books
end
