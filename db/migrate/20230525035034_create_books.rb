class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :publisher
      t.string :image_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
