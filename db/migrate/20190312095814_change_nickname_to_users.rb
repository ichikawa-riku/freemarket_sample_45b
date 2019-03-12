class ChangeNicknameToUsers < ActiveRecord::Migration[5.0]
  def change
    change_column_null :users, :nickname, true
  end
end
