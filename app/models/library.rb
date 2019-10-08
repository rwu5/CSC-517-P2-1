class Library < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true
  validates :max_day_can_borrow, presence: true, numericality: {greater_than_or_equal_to: 1}
  validates :overdue_fine, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :university_id, presence: true
  belongs_to :university
  has_many :books
end
