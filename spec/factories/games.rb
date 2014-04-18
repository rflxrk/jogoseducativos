# Read about factories at https://github.com/thoughtbot/factory_girl
include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :game do
    category
    puzzle { fixture_file_upload('spec/support/image.png') }

    factory :invalid_game do
      puzzle nil
    end
  end
end
