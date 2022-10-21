require_relative 'start'
require_relative 'app'

class Main
  def initialize
    @app = App.new
    @input = 0
  end

  def option
    print 'Welcome to the CATALOG APP!'
    while @input != 7
      print "\nPlease choose an option by entering a number: \n\n"
      print "1 - List all books\n"
      print "2 - List all labels\n"
      puts "3 - List All Music Albums\n"
      puts "4 - List All Genres\n"
      puts "5 - Create a Book\n"
      puts "6 - Add Music Album\n"
      print "7 - Exit\n"
      start_app
    end
    abort '************** Thank you, BYE!!! **************'
  end
end

main = Main.new
main.option
