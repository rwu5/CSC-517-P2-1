class AddColumnsToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :name, :string
    add_column :students, :education_level, :integer
    add_reference :students, :university, foreign_key: true
  end
end
