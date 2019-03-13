class CreateCreditCards < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_cards do |t|
      t.string :customer_id
      t.string :card_id
      t.string :token_id
      t.references :user, null: false
      t.timestamps
    end
  end
end
