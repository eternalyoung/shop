class Basket
  def initialize
    @products = []
  end

  def add(product)
    @products.push(product)
  end

  def last_added
    @products[-1]
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
