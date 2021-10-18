FactoryBot.define do
  factory :study do
    title                      { Faker::Name.initials(number: 2) }
    content                    { Faker::Name.initials(number: 2) }
    association :user
  end
end
