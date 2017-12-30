class GreatestFilms::Comedy
  attr_accessor :name, :rating, :url, :movie_info, :director, :cast, :reviews

  @@all = []

def initialze(name = nil, rating = nil, url = nil)
  @name = name
  @rating = rating
  @url = url
  @@all << self
end

def self.all
  @@all
end
end
