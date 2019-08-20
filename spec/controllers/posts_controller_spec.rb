require 'rails_helper'

describe PostsController do
    describe "#show" do
        context "when record is found" do
            it "renders show template" do
                @user = create(:user)
                @post = create(:post, user: @user)
                get :show, params: { id: 1 }
                expect(response).to render_template(:show)
            end
        end
    end
end