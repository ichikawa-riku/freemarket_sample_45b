crumb :root do
  link "メルカリ", root_path
end

### ↓↓マイページ関係↓↓ ###

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

# profiles#new
crumb :new_profile do
  link "本人情報の登録", new_user_profile_path
  parent :users
end

# credit_card#index
crumb :index_credit_card do
  link "支払い方法", user_credit_card_index_path
  parent :users
end

# credit_card#new
crumb :new_credit_card do
  link "クレジットカード情報入力", new_user_credit_card_path
  parent :index_credit_card
end

    ### ↓↓ブランド関係↓↓ ###

# ページビューなし
crumb :index_brands do
  link "ブランド一覧"
  parent :root
end

# brands#show
crumb :show_brands do
  link "ナイキ"
  parent :index_brands
end

    ### ↓↓カテゴリ関係↓↓ ###

# ページビューなし
crumb :index_categories do
  link "カテゴリ一覧"
  parent :root
end

# categories#show
crumb :show_categories do
  link "メンズ"
  parent :index_categories
end

    ### ↓↓商品購入↓↓ ###

# products#show
crumb :show_products do |product|
  link "#{product.name}"
  parent :root
end
