class Item
  def initialize(id, label, publish_date, archived)
    @id = id
    @label = label
    @publish_date = publish_date
    @archived = archived
  end

  def add_genre(genre)
    @genre = genre
  end

  def add_author(author)
    @author = author
  end

  def add_source(source)
    @source = source
  end
end
