FactoryBot.define do
  factory :user do
    gimei = Gimei.name
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    nickname { Faker::Name.initials(number: 2) }
    first_name_kanji { gimei.first.kanji }
    family_name_kanji { gimei.last.kanji }
    first_name_kana { gimei.first.katakana }
    family_name_kana { gimei.last.katakana }
    birthday { Faker::Date.backward }
  end
end
