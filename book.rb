require_relative 'items'

class Book < Items
  attr_accessor :publisher, :cover_state, :archived

  def initialize(_id, publish_date, _archived, publisher, cover_state)
    super(publisher)
    @id = Random.rand(1..1000)
    @publisher = publisher
    @cover_state = cover_state
    @archived = false
    @publish_date = publish_date
  end

  def can_be_archived?
    if cover_state == 'bad' || super
      true
    else
      false
    end
  end
end
book = Book.new(1, '2019-01-01', false, 'publisher', 'bad')
puts book.publish_date
