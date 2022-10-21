require_relative 'book'
require_relative 'label'
require 'json'

class App
  attr_accessor :books

  def initialize()
    @books = []
    @labels = []
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
