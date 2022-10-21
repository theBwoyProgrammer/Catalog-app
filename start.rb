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
    @app.create_book
  when 6
    @app.add_music_album
  end
end
