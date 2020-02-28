FactoryBot.define do
  factory :comment do
    user_id { 1 }
    item_id { 1 }
    text { "MyText" }
  end
end
