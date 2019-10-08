class Book < ApplicationRecord
  validates :isbn, :isbn_format => true, presence: true
  validates :title, presence: true
  validates :is_special_collection, presence: true
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  belongs_to :university
  belongs_to :library

  def self.search(title, author, subject, date)
      if !title.blank? || !author.blank? || !subject.blank? || !date.blank?
        where(["author LIKE ?", "%#{author}%"]).where(["title LIKE ?","%#{title}%"]).where(["subject LIKE ?", "%#{subject}%"]).where(["published_date LIKE ?","%#{date}%"])
      else
        all
      end
  end

end

