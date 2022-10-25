class Book < Product
  attr_accessor :title, :genre, :author

  def initialize(params)
    super
    @title = params[:title]
    @genre = params[:genre]
    @author = params[:author]
  end

  def to_s
    "Книга «#{@title}», #{@genre}, автор — #{@author}, #{@price} руб. (осталось #{@count})"
  end

  def self.from_file(path)
    lines = File.readlines(path, chomp: true)
    new(title: lines[0], genre: lines[1], author: lines[2], price: lines[3], count: lines[4])
  end
end
