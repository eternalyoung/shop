require_relative "lib/product_collection"
collection = ProductCollection.from_dir("#{__dir__}/data")

basket = []
basket_price = 0

loop do
  puts "\nЧто хотите купить:"
  collection.to_a.each.with_index(1) do |product, index|
    puts "#{index}: #{product}"
  end
  puts "0: Выход"

  user_chose = $stdin.gets.to_i - 1
  break if user_chose.negative?

  if collection.to_a[user_chose].count.positive?
    basket.push(collection.buy!(user_chose))
    basket_price += basket[-1].price

    puts "\nВы выбрали: #{basket[-1]}"
    puts "\nВсего товаров на сумму: #{basket_price} руб"
  else
    puts "У нас закончился данный товар."
  end
end

puts "Вы купили:"
basket.each { |item| puts item.to_s }
puts "С Вас — #{basket_price} руб. Спасибо за покупки!"
