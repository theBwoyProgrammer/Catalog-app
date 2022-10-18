class Items
  attr_accessor :publish_date, :label, :genre, :author, :archived, :source

  def initialize(id, publish_date)
    @id = id
    @publish_date = publish_date
    @archived = false
  end

  def add_genre(genre)
    @genre = genre
  end

  def add_author(author)
    @author = author
  end

  def add_label(label)
    @label = label
  end

  def add_source(source)
    @source = source
  end

  def move_to_archive
    @archived = true if can_be_archived? == true
  end

  private

  def can_be_archived?
    @archived = true
  end
end
