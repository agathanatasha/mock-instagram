class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable,
           :timeoutable, :omniauthable, omniauth_providers: [:google_oauth2]
    has_many :posts, dependent: :destroy
    has_one_attached :avatar

    has_many :mentions

    USERNAME_REGEX = Regexp.union(/\A[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*\z/, Devise.email_regexp)
    validates :username, format: USERNAME_REGEX,
              length: { minimum: 3, maximum: 40 },
              presence: true,
              uniqueness: {case_sensitive: false}

    def self.from_omniauth(access_token)
        data = access_token.info
        user = User.where(email: data['email']).first

        # Uncomment the section below if you want users to be created if they don't exist
        unless user
            user = User.create(username: data['email'],
               email: data['email'],
               password: Devise.friendly_token[0,20]
            )
        end
        user
    end
end
