module GoogleSignupHelper
    def self.stub_omniauth
        OmniAuth.config.test_mode = true
        OmniAuth.config.mock_auth[:google_oauth2] = 
        OmniAuth::AuthHash.new({
            provider: "google",
            uid: "12345678910",
            info: {
              email: "jesse@google.com",
              first_name: "Jesse",
              last_name: "Spevack"
            },
            credentials: {
              token: "abcdefg12345",
              refresh_token: "12345abcdefg",
              expires_at: DateTime.now,
            }
          })
    end
end