require 'rails_helper'

describe User do
    context 'valid username' do
        context 'length' do
            it 'should be longer than 2' do
                expect(build(:user, username: "he")).to_not be_valid
            end

            it 'should be at least 3' do
                expect(build(:user, username: "dam")).to be_valid
            end

            it 'should be no longer than 40' do
                username = 'a' * 40
                expect(build(:user, username: username)).to be_valid
            end


            it 'should not be longer than 40 characters' do
                username = 'a' * 41
                expect(build(:user, username: username)).to_not be_valid
            end
        end

        context 'format' do
            it 'takes alphanumeric string' do
                expect(build(:user, username: Faker::Alphanumeric.alphanumeric(number: 10))).to be_valid
            end

            it 'allows underscore character' do
                expect(build(:user, username: Faker::Internet.username(specifier: 10, separators: %w(_)))).to be_valid
            end
    
            it 'allows hyphen character' do
                expect(build(:user, username: Faker::Internet.username(specifier: 10, separators: %w(-)))).to be_valid
            end
        end

        context 'uniqueness' do
            it 'is not case sensitive' do
                user1 = create(:user, username: "Danny")
                user2 = build(:user, username: "danny")
                expect(user2).to_not be_valid
            end
        end

        context 'presence' do
            it 'must be present' do
                expect(build(:user, username: nil)).to_not be_valid
            end
        end
    end
end