FactoryGirl.define do
  factory :user do
    name    "Hiroki Yamamoto"
    email   "hiroki@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
