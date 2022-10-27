class Film < Product
  attr_accessor :title, :year, :author

  def initialize(params)
    super
    @title = params[:title]
    @year = params[:year]
    @author = params[:author]
  end

  def to_s
    "Фильм «#{@title}», #{@year}, реж. #{@author}, #{@price} руб."
  end

  def self.from_file(path)
    lines = File.readlines(path, chomp: true)
    new(title: lines[0], year: lines[2], author: lines[1], price: lines[3], count: lines[4])
  end
end
