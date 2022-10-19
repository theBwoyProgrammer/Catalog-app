class Label
  attr_accessor :id, :title, :color, :items

  def initialize(id, title, color, _items)
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    items.add_label(self) unless item.include?(self)
  end
end
label = Label.new(1, 'title', 'color', 'items')
puts label.title
