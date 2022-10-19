require_relative 'spec_helper'

describe('Genre') do
  it('should initialize a genre') do
    genre = Genre.new('genre')
    expect(genre.name).to(eq('genre'))
  end
end
