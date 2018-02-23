require 'pry'
class GreatestFilms::Scraper
  def get_page
    Nokogiri::HTML(open("https://www.rottentomatoes.com/top/bestofrt/top_100_comedy_movies/"))
  end

  def scrape_film_index
    self.get_page.css("section#top_movies_main td a").slice(0,10)
  end

  def make_comedies
    scrape_film_index.each do |c|
      GreatestFilms::Comedy.new_from_index(c)
      binding.pry
    end
  end
end
