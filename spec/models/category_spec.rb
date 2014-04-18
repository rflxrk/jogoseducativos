require 'spec_helper'

describe Category do
  it 'has valid factory' do
    expect(build(:category)).to be_valid
  end

  it 'has invalid factory' do
    expect(build(:invalid_category)).not_to be_valid
  end

  describe 'invalid attributes' do
    it 'cannot have blank name' do
      expect(build(:category, name: '')).to have(1).errors_on(:name)
    end

    it 'cannot have duplicated (case insensitive) name' do
      create(:category, name: 'AAA')
      expect(build(:category, name: 'aaa')).to have(1).errors_on(:name)
    end
  end
end
