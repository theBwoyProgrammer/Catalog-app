require_relative 'start'
require_relative 'app'

class Main
  def initialize
    @app = App.new
    @input = 0
  end

  def option
    print 'Welcome to the CATALOG APP!'
    while @input != 4
      print "\nPlease choose an option by entering a number: \n\n"
      print "1 - Create a Book\n"
      print "2 - List all books\n"
      puts "3 - List all labels\n"
      print "4 - Exit\n"
      start_app
    end
    abort '************** Thank you, BYE!!! **************'
  end
end
main = Main.new
main.option
