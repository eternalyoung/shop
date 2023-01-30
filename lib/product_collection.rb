require_relative "product"
require_relative "book"
require_relative "film"
require_relative "disk"

class ProductCollection
  FOLDER_NAMES = {
    Film => "films",
    Book => "books",
    Disk => "disks"
  }.freeze

  def self.from_dir(path)
    products =
      FOLDER_NAMES.map do |type, folder|
        Dir["#{path}/#{folder}/*.txt"].map { |film_path| type.from_file(film_path) }
      end.flatten
    new(products)
  end

  def initialize(products)
    @products = products
  end

  def delete_product!(index)
    @products[index].count -= 1
    @products[index]
  end

  def in_stock?(index)
    index < size && to_a[index].count.positive?
  end

  def size
    to_a.size
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

  def to_a
    @products
  end

  def to_s
    output = ""
    @products.each.with_index(1) do |product, index|
      output << "\n#{index}: #{product} (осталось #{product.count})" if product.count.positive?
    end
    output
  end
end
