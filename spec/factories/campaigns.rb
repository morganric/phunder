# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :campaign do
    name "MyString"
    description "MyText"
    user_id 1
    target 1
    live false
    price 1
    image "MyString"
    banner "MyString"
  end
end
