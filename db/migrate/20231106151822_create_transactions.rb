class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.references :account, null: false, foreign_key: true
      t.boolean :duplicated
      t.string :mode
      t.string :status
      t.datetime :made_on
      t.decimal :amount, precision: 19, scale: 10, null: false, default: 0.0
      t.string :currency_code, limit: 3
      t.string :description
      t.string :category
      t.string :extra

      t.timestamps
    end
  end
end
