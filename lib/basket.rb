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
    @products.map(&:price).sum
  end

  def to_s
    @products.uniq.map { |product| "#{product} #{@products.count(product)} шт." }.join("\n")
  end
end
