require 'json'
require_relative 'music_album/music_album'
require_relative 'genre/genre'
require_relative './books_labels/book'
require_relative './books_labels/label'
require_relative 'author/author'
require_relative 'game/game'

class App
  attr_accessor :books
  attr_reader :music_albums

  def initialize
    @music_albums = []
    @books = []
    @labels = []
    @authors = []
    @games = []
  end

  # Add new Music Album 
  def add_music_album
    print 'Does this music on sportigy? (Y/N) '
    sportify = gets.chomp.downcase == 'y'
    print 'Enter publish date (YYYY-MM-DD): '
    publish_date = gets.chomp
    music = MusicAlbum.new(publish_date, sportify)
    add_genre(music)
    puts 'Music album added successfully'
    music_data_store(music)
  end

  # Store new Music Album to json
  def music_data_store(music)
    hash = {
      id: music.id,
      on_spotify: music.on_spotify,
      archived: music.archived,
      genre_id: music.genre.id,
      publish_date: music.publish_date
    }
    file = File.size('./dataStore/musicAlbum.json').zero? ? [] : JSON.parse(File.read('./dataStore/musicAlbum.json'))
    file << hash
    File.write('./dataStore/musicAlbum.json', file.to_json)
  end

  # List All Music Album
  def list_all_music_albums
    puts '____________________________________________________________________________________________'
    puts "\nList of All Music Albums"
    musics = File.size('./dataStore/musicAlbum.json').zero? ? [] : JSON.parse(File.read('./dataStore/musicAlbum.json'))
    musics.each do |music|
      puts "Published date: #{music['publish_date']}, On Spotify: #{music['on_spotify']}, Genre: #{music['genre_id']}"
    end
    puts '____________________________________________________________________________________________'
  end

  # Adding New Genre 
  def add_genre(item)
    print 'Enter Genre Name: '
    name = gets.chomp
    genre = Genre.new(name)
    genre.add_item(item)
    store_genre(genre)
  end

  # Storing new Genre to json
  def store_genre(genre)
    hash = {
      id: genre.id,
      name: genre.name
    }
    file = File.size('./dataStore/genres.json').zero? ? [] : JSON.parse(File.read('./dataStore/genres.json'))
    file << hash
    File.write('./dataStore/genres.json', file.to_json)
  end

  # Listing All Genre
  def list_all_genres
    puts '____________________________________________________________________________________________'
    puts 'List of All Genres'
    genres = File.size('./dataStore/genres.json').zero? ? [] : JSON.parse(File.read('./dataStore/genres.json'))
    genres.each do |genre|
      puts "Genre: #{genre['id']} -  #{genre['name']}"
    end
    puts '____________________________________________________________________________________________'
  end

  # Creating New Book
  def create_book
    puts 'Enter the book publisher: '
    publisher = gets.chomp
    puts 'Enter publish date (YYYY-MM-DD): '
    publish_date = gets.chomp
    puts 'Enter the book cover state: '
    cover_state = gets.chomp
    books = Book.new(publisher, publish_date, cover_state)
    label = add_label
    label.add_item(books)
    @labels << label
    @books << books
    save_books(books)
    save_labels(label)
    puts '********** Book and Label created successfully **********'
  end

  # Saving New Book to json
  def save_books(books)
    book = {
      id: books.id,
      publisher: books.publisher,
      publish_date: books.publish_date,
      archived: books.archived,
      cover_state: books.cover_state
    }
    file = File.size('./bookDataStore/book.json').zero? ? [] : JSON.parse(File.read('./bookDataStore/book.json'))
    file << book
    File.write('./bookDataStore/book.json', file.to_json)
  end

  # Listing All new Books
  def list_books
    puts '____________________________________________________________________________________________'
    puts "\nList of All Books\n"
    books = File.size('./bookDataStore/book.json').zero? ? [] : JSON.parse(File.read('./bookDataStore/book.json'))
    books.each do |book|
      puts "ID: #{book['id']} Publisher: #{book['publisher']} Publish Date: #{book['publish_date']} Archived: #{book['archived']} Cover State: #{book['cover_state']}"
    end
    puts '____________________________________________________________________________________________'
  end

  # Adding New Label
  def add_label
    puts 'Enter the label title: '
    title = gets.chomp
    puts 'Enter the label color: '
    color = gets.chomp
    Label.new(title, color)
  end

  # Saving New Label
  def save_labels(label)
    label = {
      id: label.id,
      title: label.title,
      color: label.color
    }
    file = File.size('./bookDataStore/label.json').zero? ? [] : JSON.parse(File.read('./bookDataStore/label.json'))
    file << label
    File.write('./bookDataStore/label.json', file.to_json)
  end

  # Listing All New Labels
  def list_labels
    puts '____________________________________________________________________________________________'
    puts 'List of All Labels'
    labels = File.size('./bookDataStore/label.json').zero? ? [] : JSON.parse(File.read('./bookDataStore/label.json'))
    labels.each do |label|
      puts "Id: #{label['id']}, Title: #{label['title']}, Color: #{label['color']}"
    end
    puts '____________________________________________________________________________________________'
  end

  # Creating new Game
  def create_game
    print 'Is game multiplayer (Yes/No): '
    multiplayer = gets.chomp
    print 'Enter last played at (YYYY-MM-DD): '
    last_played_at = gets.chomp
    print 'Publisth Data (YYYY-MM-DD): '
    publish_date = gets.chomp
    games = Game.new(multiplayer, last_played_at, publish_date)
    add_author(games)
    @games << games
    save_game(games)
    puts '********** Game a created successfully **********'
  end

  # Listing All Games
  def list_all_game
    puts '____________________________________________________________________________________________'
    puts "\nList of All Games "
    games = File.size('./dataStore/games.json').zero? ? [] : JSON.parse(File.read('./dataStore/games.json'))
    games.each do |game|
      puts "Multiplayer: #{game['multiplayer']}, Last player: #{game['last_played_at']}, publish Date: #{game['publish_date']}"
    end
    puts '____________________________________________________________________________________________'
  end

  # Saving All new Games
  def save_game(games)
    game = {
      id: games.id,
      multiplayer: games.multiplayer,
      last_played_at: games.last_played_at,
      publish_date: games.publish_date
    }
    file = File.size('./dataStore/games.json').zero? ? [] : JSON.parse(File.read('./dataStore/games.json'))
    file << game
    File.write('./dataStore/games.json', file.to_json)
  end


  # Adding New Author
  def add_author(games)
    puts 'Enter first name: '
    first_name = gets.chomp
    puts 'Enter last name: '
    last_name = gets.chomp
    authors = Author.new(first_name, last_name)
    @authors << authors
    save_author(authors)
  end

  #listing All Authers
  def list_author
    puts '____________________________________________________________________________________________'
    puts "\nList of All Author "
    authors = File.size('./dataStore/authors.json').zero? ? [] : JSON.parse(File.read('./dataStore/authors.json'))
    authors.each do |author|
      puts "First name: #{author['first_name']}, Last name: #{author['last_name']},"
    end
    puts '____________________________________________________________________________________________'
  end

  # Saving New Author
  def save_author(authors)
    author = {
      id: authors.id,
      first_name: authors.first_name,
      last_name: authors.last_name
    }
    file = File.size('./dataStore/authors.json').zero? ? [] : JSON.parse(File.read('./dataStore/authors.json'))
    file << author
    File.write('./dataStore/authors.json', file.to_json)
  end
end
