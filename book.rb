require_relative 'items'

class Book < Items
  attr_accessor :publisher, :cover_state, :books, :archived

  def initialize(publisher, cover_state)
    super(publisher)
    @publisher = publisher
    @cover_state = cover_state
    @books = []
  end

  def can_be_archived?
    if cover_state == 'bad' || super
      true
    else
      false
    end
  end

  def create_book
    puts 'Enter the book publisher:'
    publisher = gets.chomp
    puts 'Enter the book cover state:'
    cover_state = gets.chomp
    @books << Book.new(publisher, cover_state)

    puts '********** Book created successfully **********'
  end
end
book = Book.new('MCG Pub', 'good')
puts book.create_book
