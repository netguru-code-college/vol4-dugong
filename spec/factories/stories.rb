FactoryBot.define do
  factory :story do
    title { "MyString" }
    category { false }
    text { "MyText" }
    picture { "MyString" }
    user { nil }
  end
end
