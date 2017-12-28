class GreatestFilms::CLI

  def call
    puts "Welcome to Rotten Tomatoes Greatest Comedies!"
  end

  def start
    input = nil
    while input!= "exit"
      puts ""
      puts "Which film would you like to further explore? Enter 1 - 10."
      puts "If you would like to exit, type 'exit'"
      input = gets.strip
      if input == "exit"
        puts "Thank you for visiting Rotten Tomatoes Greatest Comedies. Goodbye!"
        exit
      end
    end
  end

end
