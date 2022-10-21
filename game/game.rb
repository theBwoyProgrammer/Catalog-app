require_relative '../items'

class Game < Items
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date)
    super(publish_date)
    @multiplayer = multiplayer || 'Unknown'
    @last_played_at = last_played_at || Time.now
  end

  def can_be_archived?
    super && Time.now.year - last_played_at.year > 2
  end
end
