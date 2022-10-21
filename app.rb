require_relative 'book'
require_relative 'label'

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
    puts '********** Book and Label created successfully **********'
  end

  def list_books
    @books.each_with_index do |book, index|
      puts '____________________________________________________________________________________________'
      puts "#{index + 1}. publisher: #{book.publisher} publish_date: #{book.publish_date} Archived: #{book.archived} cover_state: #{book.cover_state}"
      puts '____________________________________________________________________________________________'
    end
  end

  def add_label
    puts 'Enter the label title: '
    title = gets.chomp
    puts 'Enter the label color: '
    color = gets.chomp
    Label.new(title, color)
  end

  def list_labels
    @labels.each_with_index do |label, index|
      puts '____________________________________________________________________________________________'
      puts "#{index + 1}. Title: #{label.title} Color: #{label.color}"
      puts '____________________________________________________________________________________________'
    end
  end
end
