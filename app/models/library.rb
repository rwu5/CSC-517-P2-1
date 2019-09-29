class Library < ApplicationRecord
  belongs_to :university
  has_many :books
end
