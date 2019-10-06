class Book < ApplicationRecord
  validates :isbn, :isbn_format => true, presence: true
  validates :title, presence: true
  validates :is_special_collection, presence: true
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  belongs_to :university
  belongs_to :library

  def self.search(title, isbn, univ, lib)
      if !title.blank? || !isbn.blank? || !univ.blank? || !lib.blank?
        where(["isbn LIKE ?", "%#{isbn}%"]).where(["title LIKE ?","%#{title}%"]).where(["university_id LIKE ?", "%#{univ}%"]).where(["library_id LIKE ?","%#{lib}%"])
      else
        all
      end
  end

end

