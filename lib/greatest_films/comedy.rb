require 'pry'
class GreatestFilms::Comedy
  attr_accessor :name, :rating, :url, :movie_info, :director, :cast, :reviews

  @@all = []

  def self.new_from_index(c)
    self.new(
    c.css("td a", "unstyled articleLink").text,
    c.css(".tMeterScore").text,
    "http://www.rottentomatoes.com#{c.css("a").attributes_for("href").text}"
  )
end

def initialize(name=nil, rating=nil, url=nil)
  @name = name
  @rating = rating
  @url = url
  @@all << self
end

def self.all
  @@all
end

def self.find(id)
  self.all[id-1]
end

def movie_info
  @movie_info ||= data.xpath("//div[@class='movie_synopsis clamp clamp-6']").text
end

def director
  @director ||= data.xpath("//ul[@class='content-meta info']/li[3]/div[2]").text
end

def cast
  @cast ||= data.search("div.castSection").text
end

def reviews
  @reviews ||= data.xpath("//div[@id='scoreStats']").text
end

def data
  @data ||= Nokogiri::HTML(open(self.url))
end
end
