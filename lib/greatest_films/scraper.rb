class GreatestFilms::Scraper
  def get_page
    Nokogiri::HTML(open("http://www.rottentomatoes.com/top/bestofrt/top_100_comedy_movies/"))
  end

  def scrape_film_index
    self.get_page.css("section#topmovies_main td a").slice(0,9)
  end

end
