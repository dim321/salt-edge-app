class CreateProviders < ActiveRecord::Migration[7.1]
  def change
    create_table :providers do |t|
      t.string :saltedge_id
      t.string :name
      t.string :code
      t.integer :mode, null: false, default: 0
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
