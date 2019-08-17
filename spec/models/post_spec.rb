require 'rails_helper'

describe Post do
    context "RecordNotFound Error" do
        it "when record is never created" do
            expect{ Post.find(1) }.to raise_error(ActiveRecord::RecordNotFound)
        end
        
        it "when record is deleted" do
            @user = create(:user)
            @post = create(:post, user: @user)
            @post.destroy
            expect{ Post.find(1) }.to raise_error(ActiveRecord::RecordNotFound)
        end
    end
end