require_relative "product"
require_relative "book"
require_relative "film"
require_relative "disk"

class ProductCollection
  FOLDER_NAMES = {
    Film => "films",
    Book => "books",
    Disk => "disks"
  }
  def initialize(products)
    @products = products
  end

  def self.from_dir(path)
    products = []
    FOLDER_NAMES.each_pair do |type, folder|
      products += (Dir["#{path}/#{folder}/*.txt"].map { |film_path| type.from_file(film_path) })
    end
    new(products)
  end

  def to_a
    @products
  end

  def sort!(params)
    case params[:by]
    when :title then @products.sort_by!(&:title)
    when :price then @products.sort_by!(&:price)
    when :count then @products.sort_by!(&:count)
    end
    @products.reverse! if params[:order] == :asc
    self
  end

  def delete_product!(index)
    @products[index].count -= 1
    @products[index]
  end

  def to_s
    output = ""
    @products.each.with_index(1) do |product, index|
      output << "\n#{index}: #{product}" if product.count.positive?
    end
    output
  end
end
