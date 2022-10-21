require_relative '../items'

class Book < Items
  attr_accessor :publisher, :cover_state

  def initialize(publisher, publish_date, cover_state)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    @archived = if cover_state == 'bad' || super
                  true
                else
                  false
                end
  end
end
