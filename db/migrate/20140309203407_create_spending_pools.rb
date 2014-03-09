class CreateSpendingPools < ActiveRecord::Migration
  def change
    create_table :spending_pools do |t|
      t.string :source
      t.float :amount
      t.text :description
      t.datetime :received_on
      t.references :event, index: true

      t.timestamps
    end
  end
end
