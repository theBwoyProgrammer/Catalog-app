require_relative '../items'

class MusicAlbum < Items
  attr_reader :on_spotify

  def initialize(publish_date, on_spotify)
    super(publish_date: Date.today.to_s)
    puts @on_spotify = on_spotify
  end

  def can_be_archived?
    return true if super && on_spotify
  end
end

music = MusicAlbum.new('2022-2-6', 'NIzam')

music
