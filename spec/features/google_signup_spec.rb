require 'rails_helper'
require_relative '../support/google_signup_helper'

describe "Google signup" do
    it 'signs up successfully' do
        GoogleSignupHelper.stub_omniauth

        visit new_user_registration_path
        click_link "google-signin"

        expect(page).to have_css("div.alert", text: "Successfully authenticated from Google account.")
    end
end