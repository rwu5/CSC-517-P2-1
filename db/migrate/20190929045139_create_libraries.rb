class CreateLibraries < ActiveRecord::Migration[6.0]
  def change
    create_table :libraries do |t|
      t.string :name
      t.string :location
      t.integer :max_day_can_borrow
      t.integer :overdue_fine

      t.timestamps
    end
  end
end
