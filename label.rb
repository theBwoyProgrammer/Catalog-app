class Label
  def initialize(id, title, color, items)
    @id = id
    @title = title
    @color = color
    @items = []
 end

    def add_item = (item)
      @items << item
      items.add_label(self) unless item.include?(self)
     end
    
label = Label.new('1', 'MCG Pub', 'red', 'book')
puts label.add_item('book')