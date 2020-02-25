FactoryBot.define do

  factory :item do
    name                      {"てすたろう"}
    description               {"コート"}
    category_id               {200}
    price                     {"1500"}
    condition                 {"未使用に近い"}
    derivery_charge           {2}
    days                      {2}
    prefecture_id             {1}
  end
end