require "csv"

CSV.foreach('db/seeds/csv/area.csv') do |row|

Area.create(prefecture: row[0])

end
