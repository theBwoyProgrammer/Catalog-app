require_relative 'start'
require_relative 'app'

class Main
  def initialize
    @app = App.new
    @input = 0
  end

  def option
    print 'Welcome to the CATALOG APP!'

    while @input != 10
      print "\nPlease choose an option by entering a number: \n\n"
      print "1 - List All Books\n"
      print "2 - List All Labels\n"
      puts "3 - List All Music Albums\n"
      puts "4 - List All Genres\n"
      puts "5 - List All Games\n"
      puts "6 - List All Authors\n"
      puts "7 - Create a Book\n"
      puts "8 - Create Music Album\n"
      puts "9 - Create Game\n"

      print "10 - Exit\n"

      start_app
    end
    abort '************** Thank you, BYE!!! **************'
  end
end

main = Main.new
main.option
