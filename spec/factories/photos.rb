# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :photo do
    title "MyString"
    image "MyString"
    campaign_id 1
    user_id 1
    paid 1
  end
end
