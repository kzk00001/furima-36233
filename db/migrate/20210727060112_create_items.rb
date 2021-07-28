class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product_name,             null: false, default: ""
      t.text :text,                       null: false
      t.integer :price,                   null: false
      t.integer :category_id,             null: false
      t.integer :condition_id,            null: false
      t.integer :shipping_method_id,      null: false
      t.integer :prefecture_id,           null: false
      t.integer :days_before_shipping_id, null: false
      t.references :user,                 null: false, foreign_key: true
      t.timestamps
    end
  end
end
