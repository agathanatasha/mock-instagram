require 'rails_helper'

describe HashTag do
    it "is valid with a name" do
        expect(build(:hash_tag)).to be_valid
    end

    it "is invalid without a name" do
        hash_tag = build(:hash_tag, name: nil)
        hash_tag.valid?
        expect(hash_tag.errors[:name]).to include("can't be blank")
    end

    it "requires unique name" do
        hash_tag1 = create(:hash_tag)
        hash_tag2 = build(:hash_tag)
        hash_tag2.valid?
        expect(hash_tag2.errors[:name]).to include("has already been taken")
    end

    it "is case insensitive" do
        hash_tag1 = create(:hash_tag, name: "toronto")
        hash_tag2 = build(:hash_tag, name: "ToRonTo")
        hash_tag2.valid?
        expect(hash_tag2.errors[:name]).to include("has already been taken")
    end
end