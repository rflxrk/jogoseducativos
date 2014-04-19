require 'spec_helper'

describe Game do
  it 'has valid factory' do
    expect(build(:game)).to be_valid
  end

  it 'has invalid factory' do
    expect(build(:invalid_game)).not_to be_valid
  end

  it ':recent scope should order by created_at DESC' do
    expect(Game.recent.load).to eq(Game.order(created_at: :desc))
  end

  it 'method Game.name should return category name and game id' do
    game = create(:game)
    expect(game.name).to eq("#{game.category.name} #{game.id}")
  end

  it '#to_param should return correct format' do
    game = create(:game)
    expect(game.to_param).to eq("#{game.id}-jogar-#{game.category.name.parameterize}")
  end

  describe 'invalid attributes' do
    it 'cannot have blank category' do
      expect(build(:game, category: nil)).to have(1).errors_on(:category)
    end

    it 'cannot have blank puzzle' do
      expect(build(:game, puzzle: nil)).to have(1).errors_on(:puzzle)
    end
  end
end
