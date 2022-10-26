class Product
  attr_accessor :price, :count

  def initialize(params)
    @price = params[:price].to_i
    @count = params[:count].to_i
  end

  def self.from_file(_path)
    raise "NotImplementedError"
  end
end
