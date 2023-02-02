require_relative '../lib/app/player'

describe 'Player' do
  describe '#initialize' do
    it "should ask user for their name" do
      require(Player.new).to output("Quel est le nom du joueur 1 ?")
    end
  end
end

