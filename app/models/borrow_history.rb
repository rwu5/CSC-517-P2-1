class BorrowHistory < ApplicationRecord
  belongs_to :library
  belongs_to :student
  belongs_to :book
end
