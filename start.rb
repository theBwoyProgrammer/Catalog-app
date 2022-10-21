# rubocop:disable all
require_relative 'app'

def start_app
  @input = gets.chomp.to_i
  case @input
  when 1
    @app.list_books
  when 2
    @app.list_labels
  when 3
    @app.list_all_music_albums
  when 4
    @app.list_all_genres
  when 5
    @app.list_all_game
  when 6
    @app.list_author
  when 7
    @app.create_book
  when 8
    @app.add_music_album
  when 9
    @app.create_game
  end
end

# rubocop:disable all
