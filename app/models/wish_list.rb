class WishList < ApplicationRecord
  belongs_to :student
  belongs_to :library_book_list
  validates :student, uniqueness: { scope: :library_book_list,
                                 message: "You can only add this book once" }
end
