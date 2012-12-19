# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book do
    title "MyString"
    info "MyText"
    isbn "MyString"
    authorname "MyString"
    price "MyString"
    publisher "MyString"
    publisherdate "2012-11-25"
    quantity 1
    user_id 1
  end
end
