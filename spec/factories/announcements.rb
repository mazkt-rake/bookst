# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :announcement do
    message "MyText"
    starts_at "2012-11-25 08:42:27"
    ends_at "2012-11-25 08:42:27"
  end
end
