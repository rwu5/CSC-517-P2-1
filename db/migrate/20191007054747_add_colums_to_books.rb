class AddColumsToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :author, :string
    add_column :books, :language, :string
    add_column :books, :published_date, :date
    add_column :books, :edition, :integer
    add_column :books, :summery, :text
    add_column :books, :subject, :string
  end
end
