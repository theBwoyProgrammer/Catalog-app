require_relative '../item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date: Time.now, archived: nil, id: rand(1..1000))
    super(publish_date, archived: archived, id: id)
    @multiplayer = multiplayer || 'Unknown'
    @last_played_at = last_played_at || Time.now
  end

  def can_be_archived?
    super && Time.now.year - last_played_at.year > 2
  end
end
