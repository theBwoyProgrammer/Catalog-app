class Label
  attr_accessor :id, :title, :color, :items

  def initialize(title, color)
    @id = Random.rand(1..1_000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    item.label = self
    items << item
  end
end
