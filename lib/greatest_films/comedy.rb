require 'pry'
class GreatestFilms::Comedy
  attr_accessor :name, :rating, :url, :movie_info, :director, :cast, :reviews

  @@all = []

  def self.new_from_index(c)
    self.new(
    c.css("td a", "unstyled articleLink").text,
    c.css(".tMeterScore").text,
    "https://www.rottentomatoes.com#{c.css("a").attribute("href").text}"
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
  @movie_info ||= data.xpath("//div[@class='movie_synopsis clamp clamp-6']").text.strip
end

def director
  @director ||= data.xpath("//ul[@class='content-meta info']/li[3]/div[2]").text.strip
end

def cast
  @cast ||= data.search("div.castSection").text.strip
end

def reviews
  @reviews ||= data.xpath("//div[@id='scoreStats']").text.strip
end

def data
  @data ||= Nokogiri::HTML(open(self.url))
end
end
