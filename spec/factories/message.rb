FactoryBot.define do
  factory :message do
    body { "hi" }
  end
  factory :second_message, class:Message do
    body { "hello" }
  end
end
