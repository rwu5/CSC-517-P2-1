class WishList < ApplicationRecord
  belongs_to :student
  belongs_to :library_book_list
end
