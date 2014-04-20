require 'spec_helper'
require 'carrierwave/test/matchers'

describe PuzzleUploader do
  include CarrierWave::Test::Matchers

  before do
    PuzzleUploader.enable_processing = true
    @uploader = PuzzleUploader.new(create(:game), :puzzle)
    @uploader.store!(File.open('spec/support/image.png'))
  end

  after do
    PuzzleUploader.enable_processing = false
    @uploader.remove!
  end

  it ':thumb version should be exactly 165x144' do
    @uploader.thumb.should have_dimensions(165, 144)
  end

  it ':play version should be no larger than 700x500' do
    @uploader.play.should be_no_larger_than(700, 500)
  end
end
