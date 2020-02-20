FactoryBot.define do
  factory :address do
    family_name {Faker::Name.first_name}
    name {Faker::Name.last_name}
    family_name_furigana {"かな"}
    name_furigana {"カナ"}
    potalcode { "5420076" }
    prefectures { "大阪府" }
    municipalities {"大阪市"}
    address {"難波５丁目"}
    building_name {"なんばスカイオ"}
    tel { "09012345678"}
  end
end

