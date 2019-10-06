class AddColumnsToLibrarians < ActiveRecord::Migration[6.0]
  def change
    add_column :librarians, :is_approved, :integer
    add_column :librarians, :name, :string
    add_reference :librarians, :library,  foreign_key: true
  end
end
