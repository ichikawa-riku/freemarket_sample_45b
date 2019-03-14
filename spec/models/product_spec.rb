require 'rails_helper'

describe User do
  describe '#create' do
    it "is valid with a name, description, price, condition, product_size_id, shipping_method, shipping_burden, estimated_date, area_id, user_id, created_at, updated_at, category_id, brand_id" do
      category = create(:category)
      brand = create(:brand)
      product_size = create(:product_size)
      area = create(:area)
      user = create(:user)
      product = build(:product, user_id: user.id, area_id: area.id, brand_id: brand.id, category_id: category.id, product_size_id: product_size.id)
      expect(product).to be_valid
    end

    it "is valid without a brand_id" do
      category = create(:category)
      brand = create(:brand)
      product_size = create(:product_size)
      area = create(:area)
      user = create(:user)
      product = build(:product, user_id: user.id, area_id: area.id, category_id: category.id, product_size_id: product_size.id)
      expect(product).to be_valid
    end

    it "is invalid with an product's name that has more than 41 characters" do
      category = create(:category)
      brand = create(:brand)
      product_size = create(:product_size)
      area = create(:area)
      user = create(:user)
      product = build(:product, name: "あ"*41, user_id: user.id, area_id: area.id, brand_id: brand.id, category_id: category.id, product_size_id: product_size.id)
      product.valid?
      expect(product.errors[:name]).to include("は40文字以内で入力してください")
    end

    it "is valid with an product's name that has less than 40 characters" do
      category = create(:category)
      brand = create(:brand)
      product_size = create(:product_size)
      area = create(:area)
      user = create(:user)
      product = build(:product, name: "あ"*39, user_id: user.id, area_id: area.id, brand_id: brand.id, category_id: category.id, product_size_id: product_size.id)
      expect(product).to be_valid
    end

    it "is invalid with an product's price that has more than 10000000" do
      category = create(:category)
      brand = create(:brand)
      product_size = create(:product_size)
      area = create(:area)
      user = create(:user)
      product = build(:product, price: 10000000, user_id: user.id, area_id: area.id, brand_id: brand.id, category_id: category.id, product_size_id: product_size.id)
      product.valid?
      expect(product.errors[:price]).to include("は9999999以下の値にしてください")
    end

    it "is invalid with an product's price that has less than 299" do
      category = create(:category)
      brand = create(:brand)
      product_size = create(:product_size)
      area = create(:area)
      user = create(:user)
      product = build(:product, price: 299, user_id: user.id, area_id: area.id, brand_id: brand.id, category_id: category.id, product_size_id: product_size.id)
      product.valid?
      expect(product.errors[:price]).to include("は300以上の値にしてください")
    end
  end

end
