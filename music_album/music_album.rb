require_relative '../items'

class MusicAlbum < Items
  attr_accessor :on_spotify

  def initialize(publish_date, on_spotify)
    super(publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    return true if super && on_spotify
  end
end
