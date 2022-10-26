require_relative "product"
require_relative "book"
require_relative "film"
require_relative "disk"

class ProductCollection
  def initialize(products)
    @products = products
  end

  def self.from_dir(path)
    films_paths = Dir["#{path}/films/*.txt"]
    books_paths = Dir["#{path}/books/*.txt"]
    disks_paws = Dir["#{path}/disks/*.txt"]
    films = films_paths.map { |film_path| Film.from_file(film_path) }
    books = books_paths.map { |book_path| Book.from_file(book_path) }
    disks = disks_paws.map { |disks_paw| Disk.from_file(disks_paw) }
    new(films + books + disks)
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

  def buy!(index)
    @products[index].count -= 1
    @products[index]
  end
end
