FactoryGirl.define do
  sequence :email do |n|
    "email-#{n}@example.com"
  end
  
  factory :user do 
    email { Factory.next(:email) }
    password "foobar"
    password_confirmation "foobar"
  end
end