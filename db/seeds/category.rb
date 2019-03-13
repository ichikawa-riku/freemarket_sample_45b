require "csv"

CSV.foreach('db/seeds/csv/category.csv') do |row|
  Category.create(main_category_id: row[1], sub_category_id: row[2], name: row[3])
end
