# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :donation do
    amount 1
    stripe_email "MyString"
    user_id 1
    campaign_id 1
    photo_id 1
  end
end
