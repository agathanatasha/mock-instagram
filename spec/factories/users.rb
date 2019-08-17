FactoryBot.define do
    factory :user do
        email { Faker::Internet.email }
        password { Faker::Internet.password }
        username { Faker::Internet.username(specifier: 3, separators: %w(_ -)) }
    end
end