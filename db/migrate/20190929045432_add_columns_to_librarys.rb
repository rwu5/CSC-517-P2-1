class AddColumnsToLibrarys < ActiveRecord::Migration[6.0]
  def change
    add_reference :libraries, :university, foreign_key: true
  end
end
