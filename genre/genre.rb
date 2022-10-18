class Genre
  attr_accessor :name, :items
  attr_reader :id

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    # item.genre == self
    @items << item unless @items.include? item
    puts @items
  end
end

genre1 = Genre.new("Nizam")

puts genre1.add_item("happy")
