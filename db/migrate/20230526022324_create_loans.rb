class CreateLoans < ActiveRecord::Migration[6.0]
  def change
    create_table :loans do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.date :due_date, null: false
      t.boolean :returned, null: false, default: false

      t.timestamps
    end
  end
end
