require_relative 'game'
require_relative  '../author/author'

def create_game
  puts 'Is game multiplayer (Yes/No): '
  multiplayer = gets.chomp
  puts 'Enter last played at (YYYY-MM-DD): '
  last_played_at = gets.chomp
  label = add_label
  label.add_item(game)
  @labels << label
  @books << books
  save_books(books)
  save_labels(label)
  puts '********** Book and Label created successfully **********'

game = Game.new(multiplayer,last_played_at)
end

def list_game
end

def save_game
end
