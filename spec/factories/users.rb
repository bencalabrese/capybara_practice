FactoryGirl.define do

  factory :user do
    username { Faker::Internet.user_name }
    password { Faker::Internet.password(7) }

    factory :john do
      username "john"
      password "password"
    end
  end
end
