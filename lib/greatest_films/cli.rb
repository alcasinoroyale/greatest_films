require 'pry'
class GreatestFilms::CLI

  def call
    GreatestFilms::Scraper.new.make_comedies
    puts "Welcome to Rotten Tomatoes Greatest Comedies!"
    list_films
    start
    list_film_selection(film)
    new_selection
  end

  def list_films
    GreatestFilms::Comedy.all.each.with_index(1) do |film, i|
      puts "#{i}. #{film.name}"
    end
  end

  def start
    input = nil
    while input != "exit"
      puts ""
      puts "Which film would you like to further explore? Enter 1 - 10."
      puts "If you would like to exit, type 'exit'"
      input = gets.strip
      comedy = GreatestFilms::Comedy.find(input.to_i)
      # binding.pry
      if input == "exit"
        puts "Thank you for visiting Rotten Tomatoes Greatest Comedies. Goodbye!"
        exit
      elsif input.to_i > 0
          if comedy
          list_film_selection(comedy)
      end
    end
  end
end

def list_film_selection(film)
  puts ""
  puts "----#{film.name} - #{film.rating}----"
  puts ""
  puts "Director:   #{film.director}"
  puts "Cast:       #{film.cast}"
  puts "Reviews:    #{film.reviews}"
  puts "Webpage:    #{film.url}"
  puts ""
  puts "----Movie Info------"
  puts ""
  puts "#{film.movie_info}"
  puts ""
  new_selection
end

def new_selection
  puts "Would you like to explore another film, Y or N?"
    input = gets.strip.downcase
      if input == "y"
        start
      elsif input == "n"
        puts ""
        puts "Thank you for visiting Rotten Tomatoes Greatest Comedies. Goodbye!"
        exit
      end
    end
end
