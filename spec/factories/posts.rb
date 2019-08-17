require_relative '../support/files_test_helper'

FactoryBot.define do
    factory :post do
        description { Faker::Lorem.sentence }
        after(:build) do |post|
            post.image.attach(io: FilesTestHelper::image_file, filename: "image")
        end
    end
end