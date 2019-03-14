class AddUserIdToCreditCards < ActiveRecord::Migration[5.0]
  def change
    add_reference :credit_cards, :user, index: true, unique: true 
  end
end
