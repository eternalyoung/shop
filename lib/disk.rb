class Disk < Product
  attr_accessor :title, :author

  def initialize(params)
    super
    @title = params[:title]
    @author = params[:author]
    @genre = params[:genre]
    @year = params[:year]
    @cost = params[:cost]
  end

  def to_s
    "Альбом #{@author} — «#{@title}», #{@genre}, #{@year}, #{@cost} руб."
  end

  def self.from_file(path)
    lines = File.readlines(path, chomp: true)
    new(title: lines[0], author: lines[1], genre: lines[2], year: lines[3], price: lines[4], count: lines[5])
  end
end
