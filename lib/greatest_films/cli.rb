class GreatestFilms::CLI

  def call
    GreatestFilms::Scraper.new.make_comedies
    puts "Welcome to Rotten Tomatoes Greatest Comedies!"
  end

  def start
    input = nil
    while input!= "exit"
      puts ""
      puts "Which film would you like to further explore? Enter 1 - 10."
      puts "If you would like to exit, type 'exit'"
      input = gets.strip
      comedy = GreatestFilms::Comedy.find(input.to_i)
      if input == "exit"
        puts "Thank you for visiting Rotten Tomatoes Greatest Comedies. Goodbye!"
        exit
      elsif input.to_i > 0
        if film = GreatestFilms::Comedy.find(input.to_i)
          list_film_selection(film)
      end
    end
  end
end

def list_film_selection(film)
end
