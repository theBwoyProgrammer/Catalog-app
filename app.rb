require 'json'
require_relative 'music_album/music_album'
require_relative 'genre/genre'

class App
  attr_reader :music_albums

  def initialize
    @music_albums = []
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
end
