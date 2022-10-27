require_relative "lib/product_collection"
require_relative "lib/basket"
collection = ProductCollection.from_dir("#{__dir__}/data")

users_basket = Basket.new

until collection.to_s.empty?
  puts "\nЧто хотите купить:"
  puts collection
  puts "0: Выход"

  user_chose = $stdin.gets.to_i - 1
  break if user_chose.negative?

  if collection.to_a[user_chose].count.positive?
    users_basket.add(collection.delete_product!(user_chose))

    puts "\nВы выбрали: #{users_basket.last_added}"
    puts "\nВсего товаров на сумму: #{users_basket.cost} руб."
  else
    puts "У нас закончился данный товар."
  end
end

puts "Вы купили:"
puts users_basket
puts "С Вас — #{users_basket.cost} руб. Спасибо за покупки!"
