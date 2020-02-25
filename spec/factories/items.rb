FactoryBot.define do

  factory :item do
    name                      {"てすたろう"}
    description               {"コート"}
    category_id               {200}
    price                     {"1500"}
    condition                 {"未使用に近い"}
    derivery_charge           {"送料込み（出品者負担）"}
    days                      {"1~2日で発送"}
    prefecture_id             {1}
  end
end