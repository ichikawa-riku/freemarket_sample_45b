class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string     :name,           null:false, index:true
      t.text       :description,    null:false
      t.integer    :price,          null:false
      t.references :area,           null:false, foreign_key: true
      t.integer    :condition,      null:false
      t.references :product_size,   null:false, foreign_key: true
      t.references :brand,          null:false, foreign_key: true
      t.integer    :shipping_method,null:false
      t.integer    :shipping_burden,null:false
      t.integer    :estimated_date, null:false
      t.references :user,           null:false, foreign_key: true
      t.timestamps
    end
  end
end
