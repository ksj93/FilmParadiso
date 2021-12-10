FactoryBot.define do
  factory :user do
    name { "AA" }
    email { "aa@test.com" }
    password { "123456" }
    confirmed_at {'2021-12-01'}
  end
  factory :user_second, class:User do
    name { "BB" }
    email { "bb@test.com" }
    password { "123456" }
    confirmed_at {'2021-12-01'}
  end
  factory :guest, class:User do
    name { "Guest" }
    email { "cc@test.com" }
    password { "123456" }
    confirmed_at {'2021-12-01'}
    guest {true}
  end
  factory :guset_admin, class:User do
    name { "AdminGuest" }
    email { "dd@test.com" }
    password { "123456" }
    confirmed_at {'2021-12-01'}
    guest {true}
    admin {true}
  end
  factory :admin, class:User do
    name { "Admin" }
    email { "ee@test.com" }
    password { "123456" }
    confirmed_at {'2021-12-01'}
    admin {true}
  end
end
