class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.float :amount
      t.text :description
      t.datetime :date
      t.references :expense, index: true

      t.timestamps
    end
  end
end
