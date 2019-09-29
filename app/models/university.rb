class University < ApplicationRecord
  has_many :libraries
  has_many :books
end
