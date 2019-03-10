class CreateProductComments < ActiveRecord::Migration[5.0]
  def change
    create_table :product_comments do |t|
      t.text       :comment, null: false
      t.references :user,    null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.timestamps
    end
  end
end
