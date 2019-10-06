class Book < ApplicationRecord
  validates :isbn, :isbn_format => true, presence: true
  validates :title, presence: true
  validates :is_special_collection, presence: true
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  belongs_to :university
  belongs_to :library

  def self.search(search, a)
      if !a.blank?
        where(["isbn LIKE ?", "%#{a}%"])
        if !search.blank?
          where(["title LIKE ?","#{search}"])
        end
      elsif search
        where(["title LIKE ?","%#{search}%"])
      else
        all
      end
  end

end

