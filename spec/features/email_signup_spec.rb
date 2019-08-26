require 'rails_helper'

describe "email signup" do
    it 'successfully signed up' do
        visit new_user_registration_path

        fill_in "Username", with: "test_user"
        fill_in "Email", with: "test_user@example.com"
        fill_in "Password", with: "testpassword"
        fill_in "Password confirmation", with: "testpassword"
        click_button "Sign up"

        expect(page).to have_css("div.alert", text: "Welcome! You have signed up successfully.")
    end
end