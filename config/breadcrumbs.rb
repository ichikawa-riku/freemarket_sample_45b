crumb :root do
  link "メルカリ", root_path
end

# users#show
crumb :users do
  link "マイページ", user_path(current_user.id)
  parent :root
end

# users#edit
crumb :edit_user do
  link "プロフィール", edit_user_path
  parent :users
end

# users#signout
crumb :signout_users do
  link "ログアウト",signout_users_path
  parent :users
end

# credit_card#new
crumb :new_credit_card do
  link "支払い方法", new_user_credit_card_path
  parent :users
end

# profiles#new
crumb :new_profile do
  link "本人情報の登録", new_user_profile_path
  parent :users
end
