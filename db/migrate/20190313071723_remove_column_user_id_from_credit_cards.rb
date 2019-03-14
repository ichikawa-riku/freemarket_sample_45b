class RemoveColumnUserIdFromCreditCards < ActiveRecord::Migration[5.0]
  def change
    remove_column :credit_cards, :user_id
  end
end
