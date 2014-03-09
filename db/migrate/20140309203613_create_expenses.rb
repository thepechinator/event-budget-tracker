class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.float :total
      t.text :description
      t.datetime :due_date
      t.references :event, index: true

      t.timestamps
    end
  end
end
