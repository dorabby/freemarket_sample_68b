 FactoryBot.define do
    factory :user do
      password = Faker::Internet.password(min_length: 7)
      nick_name {Faker::Name.last_name}
      email {Faker::Internet.free_email}
      password {password}
      password_confirmation {password}
      family_name {Faker::Name.first_name}
      name {Faker::Name.last_name}
      family_name_furigana { "かな"}
      name_furigana { "カナ"}
      birthday {Faker::Date.birthday}
    end
  end
