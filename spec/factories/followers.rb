FactoryBot.define do
  factory :follower do
    followed_id { 1 }
    followed_type { "MyString" }
  end
end
