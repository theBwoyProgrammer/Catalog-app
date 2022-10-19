require_relative 'book'

class App
  attr_accessor :books

  def initialize
    @books = []
  end

  def create_book
    puts 'Enter the book publisher:'
    publisher = gets.chomp
    puts 'Enter publish date:'
    publish_date = gets.chomp
    puts 'Enter the book archived:'
    archived = gets.chomp
    puts 'Enter the book cover state:'
    cover_state = gets.chomp
    @books << Book.new(publisher, publish_date, archived, cover_state)

    puts '********** Book created successfully **********'
  end

  def list_books
    @books.each_with_index do |book, index|
      puts "#{index + 1}. #{book.publisher} #{book.publish_date} #{book.archived} #{book.cover_state}"
    end
  end
end
