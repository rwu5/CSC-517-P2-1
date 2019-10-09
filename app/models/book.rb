class Book < ApplicationRecord
  validates :isbn, :isbn_format => true, presence: true
  validates :title, presence: true
  validates :is_special_collection, presence: true
  validates :isbn, uniqueness: { scope: :library,
                                 message: "existed in this library" }
  validates :author, presence: true
  validates :language, presence: true
  validates :published_date, presence: true
  validates :edition, presence: true
  validates :subject, presence: true
  belongs_to :university
  belongs_to :library

  def self.search(title, author, subject, date)
      if !title.blank? || !author.blank? || !subject.blank? || !date.blank?
        where(["author LIKE ?", "%#{author}%"]).where(["title LIKE ?","%#{title}%"]).where(["subject LIKE ?", "%#{subject}%"]).where(["cast(published_date as VARCHAR) LIKE ?","%#{date}%"])
      else
        all
      end
  end

end

