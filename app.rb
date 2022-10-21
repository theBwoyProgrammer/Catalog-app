require 'json'
require_relative 'music_album/music_album'
require_relative 'genre/genre'
require_relative './books_labels/book'
require_relative './books_labels/label'

class App
  attr_accessor :books
  attr_reader :music_albums

  def initialize
    @music_albums = []
    @books = []
    @labels = []
  end

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

  def list_all_music_albums
    puts "\nList of All Music Albums"
    musics = File.size('./dataStore/musicAlbum.json').zero? ? [] : JSON.parse(File.read('./dataStore/musicAlbum.json'))
    musics.each do |music|
      puts "Published date: #{music['publish_date']}, On Spotify: #{music['on_spotify']}, Genre: #{music['genre_id']}"
    end
  end

  def add_genre(item)
    print 'Enter Genre Name: '
    name = gets.chomp
    genre = Genre.new(name)
    genre.add_item(item)
    store_genre(genre)
  end

  def store_genre(genre)
    hash = {
      id: genre.id,
      name: genre.name
    }
    file = File.size('./dataStore/genres.json').zero? ? [] : JSON.parse(File.read('./dataStore/genres.json'))
    file << hash
    File.write('./dataStore/genres.json', file.to_json)
  end

  def list_all_genres
    puts 'List of All Genres'
    genres = File.size('./dataStore/genres.json').zero? ? [] : JSON.parse(File.read('./dataStore/genres.json'))
    genres.each do |genre|
      puts "Genre: #{genre['id']} -  #{genre['name']}"
    end
  end

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

  def list_books
    puts "\nList of All Books\n"
    books = File.size('./bookDataStore/book.json').zero? ? [] : JSON.parse(File.read('./bookDataStore/book.json'))
    books.each do |book|
      puts "ID: #{book['id']} Publisher: #{book['publisher']} Publish Date: #{book['publish_date']} Archived: #{book['archived']} Cover State: #{book['cover_state']}"
    end
  end

  def add_label
    puts 'Enter the label title: '
    title = gets.chomp
    puts 'Enter the label color: '
    color = gets.chomp
    Label.new(title, color)
  end

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

  def list_labels
    @labels.each_with_index do |label, index|
      puts '____________________________________________________________________________________________'
      puts "#{index + 1}. Title: #{label.title} Color: #{label.color}"
      puts '____________________________________________________________________________________________'
    end
  end
end
