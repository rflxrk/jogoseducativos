# Read about factories at https://github.com/thoughtbot/factory_girl
include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :game do
    category
    puzzle { fixture_file_upload('spec/support/image.png') }

    factory :invalid_game do
      puzzle nil
    end

    factory :game_attrs do
      puzzle { fixture_file_upload('spec/support/image.png') }
      category_id { FactoryGirl.create(:category, name: Time.now.to_f).id }

      factory :invalid_game_attrs do
        puzzle nil
        category_id 0
      end
    end
  end
end
