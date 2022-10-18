require_relative 'items'

class Book < Items
   attr_accessor :publisher, :cover_state, :archived

    def initialize(publisher, cover_state)
        super(publisher)
        @publisher = publisher
        @cover_state = cover_state
    end

    def can_be_archived?
       if cover_state == "bad" || super
           return true
         else false
        end
    end

    def create_book
       puts 'Enter the book publisher:'
       publisher = gets.chomp
       puts 'Enter the book cover state:'
       cover_state = gets.chomp
         book = Book.new(publisher, cover_state)
         return book
         puts '--------------------------------
         Book created successfully
         --------------------------------'
    end
end
book = Book.new('MCG Pub', 'good')
puts book.create_book
