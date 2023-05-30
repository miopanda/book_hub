class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.integer    :request_type_id , null: false
      t.string     :title        , null: false
      t.text       :message      , null: false
      t.boolean    :resolved     , default: false
      t.references :user         , null: false, foreign_key: true

      t.timestamps
    end
  end
end
