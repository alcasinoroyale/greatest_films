require 'pry'
class GreatestFilms::CLI

  def call
    GreatestFilms::Scraper.new.make_comedies
    puts "Welcome to Rotten Tomatoes Greatest Comedies!"
    list_films(0, 5)
    #top_rated_films
    start
    list_film_selection(film)
    new_selection
  end

  def list_films(first_number, second_number)
    GreatestFilms::Comedy.all.each.with_index(1) do |film, i|
      if i >= first_number && i <= second_number
        puts "#{i}. #{film.name}"
    end
 end
end

  #def top_rated_films
  #    GreatestFilms::Comedy.all.each.with_index(1) do |film, i|
  #  if film.rating[1..2].to_i == 99 || film.rating[1..3].to_i == 100
  #    puts "#{i}. #{film.name}. #{film.rating}"
  #  end
  # end
# end

  def start
    input = nil
    puts ""
    puts "Which film would you like to further explore? Enter 1 - 5."
    puts "If you would like to see films 6 - 10, Enter 'more'"
    puts "If you would like to exit, type 'exit'"
    while input != "exit"
      input = gets.strip
      comedy = GreatestFilms::Comedy.find(input.to_i)
        if input == "more"
            list_films(6, 10)
        elsif input == "exit"
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
        list_films(0, 5)
      elsif input == "n"
        puts ""
        puts "Thank you for visiting Rotten Tomatoes Greatest Comedies. Goodbye!"
        exit
      end
    end
  end
