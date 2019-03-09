class CreateAdresses < ActiveRecord::Migration[5.0]
  def change
    create_table :adresses do |t|
      t.integer    :zip_code, null:false
      t.references :area,     null:false,foreign_key: true
      t.string     :city,     null:false
      t.string     :adress1,  null:false
      t.string     :adress2
      t.references :user,     null:false,foreign_key: true
      t.timestamps
    end
  end
end
