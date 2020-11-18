class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title,          null: false
      t.text :catch_copy,        null: false
      t.integer :details_category_id,     null: false
      t.integer :details_status_id,       null: false
      t.integer :delivery_burden_id,      null: false
      t.integer :delivery_source_id,     null: false
      t.integer :delivery_day_id,         null: false
      t.integer :price,                   null: false
      t.references :user,                 null: false, foreign_key: true
      t.timestamps
    end
  end
end
