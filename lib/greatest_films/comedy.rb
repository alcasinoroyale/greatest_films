class GreatestFilms::Comedy
  attr_accessor :name, :rating, :url, :movie_info, :director, :cast, :reviews

  @@all = []


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
end
