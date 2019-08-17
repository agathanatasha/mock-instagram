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

        context "when record is not found" do
            before(:each) do
                get :show, params: { id: 1 }
            end

            it "renders error page" do
                expect(response).to render_template("layouts/http_status_error")
            end

            it "returns 404 error" do
                expect(response).to have_http_status(404)
            end
        end
    end
end