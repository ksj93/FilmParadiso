FactoryBot.define do
  factory :relationship do
    follower_id { 1 }
    followed_id { 2 }
  end
  factory :second_relationship, class:Relationship do
    follower_id { 3 }
    followed_id { 4 }
  end
end
