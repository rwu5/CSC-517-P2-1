class Book < ApplicationRecord
  belongs_to :university
  belongs_to :library
end
