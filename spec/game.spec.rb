require_relative 'spec_helper'
require 'rspec/autorun'

RSpec.describe 'Game' do
  before :each do
    @game = Game.new(true, '2022-10-21', '2022-10-20')
  end

  describe 'Game class instance attribute' do
    it 'return correct value' do
      expect(@game.multiplayer).to eq true
    end

    it 'return correct vlaue of lastname' do
      expect(@game.last_played_at.to_s).to eq '2022-10-21'
    end

    it 'return correct value of publish date' do
      expect(@game.publish_date.to_s).to eq '2022-10-20'
    end
  end
end
