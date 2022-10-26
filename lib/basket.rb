class Basket
  attr_reader :last_added

  def initialize
    @products = []
    @last_added
  end

  def add(product)
    @products.push(product)
    @last_added = product
  end

  def cost
    products_cost = 0
    @products.each { |product| products_cost += product.price }
    products_cost
  end

  def to_s
    @products.map { |product| "#{product.to_s} #{@products.count(product)} шт." }.uniq
  end
end
