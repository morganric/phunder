# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    user_id 1
    bio "MyText"
    image "MyString"
    image_url "MyString"
    date_of_birth "2014-08-31"
    location "MyString"
    website "MyString"
  end
end
