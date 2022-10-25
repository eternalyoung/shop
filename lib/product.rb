class Product
  attr_reader :price, :count

  def initialize(price, count)
    @price = price
    @count = count
  end
end
