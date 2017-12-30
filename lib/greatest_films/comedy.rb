class GreatestFilms::Comedy
  attr_accessor :name, :rating, :url, :movie_info, :director, :cast, :reviews

  @@all = []

def self.new_from_index(c)
  self.new(
  c.css("td[span='a.unstyled_articleLink']").text,
  c.css("td[span='tMeterScore']").text,
  "http://www.rottentomatoes.com/top/bestofrt/top_100_comedy_movies#{c.css("td a", "href").text}"
  )
end

def initialize(name = nil, rating = nil, url = nil)
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
  @movie_info ||= data.search("div.panel-heading")
end

def director
  @director ||= data.search ("div.meta-label subtle").text
end

def cast
  @cast ||= data.search("div.panel-body.content_body").text
end

def reviews
  @reviews ||= data.search("div.section#contentReviews")
end

def data
  @data ||= Nokogiri::HTML(open(self.url))
end
end
