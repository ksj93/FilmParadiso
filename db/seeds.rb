# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.create!(
   email: 'admin@filmparadiso.com',
   name: 'Admin User',
   password: '123456',
   admin:true,
   confirmed_at: "2021-12-01"
)
#user
5.times do |n|
  User.create!(
    name: Gimei.kanji,
    email: Faker::Internet.email,
    password: '123456',
    confirmed_at: "2021-12-01"
  )
end
#movie_evaluation
MovieEvaluation.create!(
  short_criticism:"無難なシリーズのスタート",
  score: 3.5,
  movie_id:566525,
  user_id: 2
)
MovieEvaluation.create!(
  short_criticism:"暇つぶしにはいい映画",
  score: 3.5,
  movie_id:550988,
  user_id: 2
)
MovieEvaluation.create!(
  short_criticism:"呼吸が長すぎて疲れる、しかし、続編が楽しみ",
  score: 4,
  movie_id:438631,
  user_id: 2
)
MovieEvaluation.create!(
  short_criticism:"ほぼ30年前の映画には思われないくらい",
  score: 4.5,
  movie_id:101,
  user_id: 2
)
MovieEvaluation.create!(
  short_criticism:"シリーズにリスペクトがある閉め",
  score: 4,
  movie_id:299534,
  user_id: 2
)



MovieEvaluation.create!(
  short_criticism:"本物の家族は何だろう",
  score: 4.5,
  movie_id:505192,
  user_id: 3
)
MovieEvaluation.create!(
  short_criticism:"視覚的に豊かだが、原作からは離れた",
  score: 3.5,
  movie_id:64682,
  user_id: 3
)
MovieEvaluation.create!(
  short_criticism:"緊張を離れないヒューマンドラマ",
  score: 5,
  movie_id:374720,
  user_id: 3
)
MovieEvaluation.create!(
  short_criticism:"宇宙に広がる家族ドラマ",
  score: 4.5,
  movie_id:157336,
  user_id: 3
)
MovieEvaluation.create!(
  short_criticism:"最悪の状況でもユーモアを忘れない心構え",
  score: 4,
  movie_id:286217,
  user_id: 3
)



MovieEvaluation.create!(
  short_criticism:"最高のヒーロームービー",
  score: 5,
  movie_id:155,
  user_id: 4
)
MovieEvaluation.create!(
  short_criticism:"社会が生み出した化け物",
  score: 5,
  movie_id:475557,
  user_id: 4
)
MovieEvaluation.create!(
  short_criticism:"どんな考えをしながら映画を作ったのかがミステリー",
  score: 1,
  movie_id:297761,
  user_id: 4
)
MovieEvaluation.create!(
  short_criticism:"ジャスティスの誕生する前に自分の墓を掘ってしまった",
  score: 2,
  movie_id:209112,
  user_id: 4
)
MovieEvaluation.create!(
  short_criticism:"アベンジャーズどころかジャスティスにもなれなかった映画",
  score: 1.5,
  movie_id:141052,
  user_id: 4
)



MovieEvaluation.create!(
  short_criticism:"自由はいつもその対価が必要だ",
  score: 4,
  movie_id:100402,
  user_id: 5
)
MovieEvaluation.create!(
  short_criticism:"一番美しい愛に関する物語",
  score: 5,
  movie_id:637,
  user_id: 5
)
MovieEvaluation.create!(
  short_criticism:"胸に残る物悲しさ",
  score: 5,
  movie_id:11216,
  user_id: 5
)
MovieEvaluation.create!(
  short_criticism:"屈従が美徳となった現代社会で",
  score: 4,
  movie_id:752,
  user_id: 5
)
MovieEvaluation.create!(
  short_criticism:"極限でこそ出る人間の残酷さと悪意",
  score: 4.5,
  movie_id:9960,
  user_id: 5
)



MovieEvaluation.create!(
  short_criticism:"弱者だと言え、善いとは言えない",
  score: 4.5,
  movie_id:496243,
  user_id: 6
)
MovieEvaluation.create!(
  short_criticism:"倒れた人を階段として踏み出して、上に上がる資本主義の素顔",
  score: 4,
  movie_id:318846,
  user_id: 6
)
MovieEvaluation.create!(
  short_criticism:"エイリアンの活躍の為、必要以上知性がなくなったキャラクター達",
  score: 2,
  movie_id:126889,
  user_id: 6
)
MovieEvaluation.create!(
  short_criticism:"我々は答えを探せる、いつでも",
  score: 4,
  movie_id:157336,
  user_id: 6
)
MovieEvaluation.create!(
  short_criticism:"理不尽に打ち込まれた銃弾",
  score: 4,
  movie_id:68718,
  user_id: 6
)

#like・favorite_genre
5.times do |m|
  5.times do |n|
    Like.create!(
      movie_evaluation_id: n+1,
      user_id: m+2
    )
  end
  FavoriteGenre.create!(
    genre_name: "アクション",
    genre_id: 28,
    user_id: m+2
  )
  FavoriteGenre.create!(
    genre_name: "アドベンチャー",
    genre_id: 12,
    user_id: m+2
  )
  FavoriteGenre.create!(
    genre_name: "ファンタジー",
    genre_id: 14,
    user_id: m+2
  )
end
#conversation・relationship
4.times do |m|
  Conversation.create!(
    sender_id:2 ,
    recipient_id:3+m
  )
  Relationship.create!(
    follower_id:m+3 ,
    followed_id:2
  )
  Relationship.create!(
    follower_id:m+2 ,
    followed_id:6
  )
end
3.times do |m|
  Conversation.create!(
    sender_id:3 ,
    recipient_id:4+m
  )
  Relationship.create!(
    follower_id:m+4 ,
    followed_id:3
  )
  Relationship.create!(
    follower_id:m+2 ,
    followed_id:5
  )
end
Relationship.create!(
  follower_id:2 ,
  followed_id:3
)
Relationship.create!(
  follower_id:6 ,
  followed_id:5
)
2.times do |m|
  Conversation.create!(
    sender_id:4 ,
    recipient_id:5+m
  )
  Relationship.create!(
    follower_id:m+5 ,
    followed_id:4
  )
  Relationship.create!(
    follower_id:m+2 ,
    followed_id:4
  )
end
Conversation.create!(
  sender_id:5 ,
  recipient_id:6
)
#message
5.times do
  Message.create!(
    body: Faker::Name.first_name ,
    conversation_id: 1,
    user_id: 2,
    read: false
  )
  Message.create!(
    body: Faker::Name.first_name ,
    conversation_id: 1,
    user_id: 3,
    read: false
  )
  Message.create!(
    body: Faker::Name.first_name ,
    conversation_id: 2,
    user_id: 2,
    read: false
  )
  Message.create!(
    body: Faker::Name.first_name ,
    conversation_id: 2,
    user_id: 4,
    read: false
  )
  Message.create!(
    body: Faker::Name.first_name ,
    conversation_id: 3,
    user_id: 2,
    read: false
  )
  Message.create!(
    body: Faker::Name.first_name ,
    conversation_id: 3,
    user_id: 5,
    read: false
  )
  Message.create!(
    body: Faker::Name.first_name ,
    conversation_id: 4,
    user_id: 2,
    read: false
  )
  Message.create!(
    body: Faker::Name.first_name ,
    conversation_id: 4,
    user_id: 6,
    read: false
  )
  Message.create!(
    body: Faker::Name.first_name ,
    conversation_id: 5,
    user_id: 3,
    read: false
  )
  Message.create!(
    body: Faker::Name.first_name ,
    conversation_id: 5,
    user_id: 4,
    read: false
  )
  Message.create!(
    body: Faker::Name.first_name ,
    conversation_id: 6,
    user_id: 3,
    read: false
  )
  Message.create!(
    body: Faker::Name.first_name ,
    conversation_id: 6,
    user_id: 5,
    read: false
  )
  Message.create!(
    body: Faker::Name.first_name ,
    conversation_id: 7,
    user_id: 3,
    read: false
  )
  Message.create!(
    body: Faker::Name.first_name ,
    conversation_id: 7,
    user_id: 6,
    read: false
  )
  Message.create!(
    body: Faker::Name.first_name ,
    conversation_id: 8,
    user_id: 4,
    read: false
  )
  Message.create!(
    body: Faker::Name.first_name ,
    conversation_id: 8,
    user_id: 5,
    read: false
  )
  Message.create!(
    body: Faker::Name.first_name ,
    conversation_id: 9,
    user_id: 4,
    read: false
  )
  Message.create!(
    body: Faker::Name.first_name ,
    conversation_id: 9,
    user_id: 6,
    read: false
  )
  Message.create!(
    body: Faker::Name.first_name ,
    conversation_id: 10,
    user_id: 5,
    read: false
  )
  Message.create!(
    body: Faker::Name.first_name ,
    conversation_id: 10,
    user_id: 6,
    read: false
  )
end
