require 'json'

module StoreBooks
  def store_books
    array = []
    @books.each do |book|
      array << {
        id: book.id,
        publisher: book.publisher,
        publish_date: book.publish_date,
        archived: book.archived,
        cover_state: book.cover_state
      }
    end
    write_json_file('books.json', array)
  end

  def read_json_file
    file = File.read('books.json')
    JSON.parse(file)
  end
end
