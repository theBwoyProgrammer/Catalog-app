require 'rspec/autorun'
require_relative '../books_labels/book'
require_relative '../books_labels/label'

RSpec.describe Book do
  it('should initialize a book') do
    book = Book.new('MCG PUB', '12-12-12', 'bad')
    expect(book.publisher).to(eq('MCG PUB'))
    expect(book.publish_date).to(eq('12-12-12'))
    expect(book.cover_state).to(eq('bad'))
  end

  it('should be able to be archived') do
    book = Book.new('MCG PUB', '12-12-12', 'bad')
    expect(book.can_be_archived?).to(eq(true))
  end
end

RSpec.describe Label do
  it('should initialize title and color') do
    label = Label.new('MCG', 'red')
    expect(label.title).to(eq('MCG'))
    expect(label.color).to(eq('red'))
  end

  it('should add items to label') do
    label = Label.new('MCG', 'red')
    book = Book.new('MCG PUB', '12-12-12', 'bad')
    label.add_item(book)
    expect(label.items).to(eq([book]))
  end
end
