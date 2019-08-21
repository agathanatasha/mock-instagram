class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :timeoutable
  has_many :posts, dependent: :destroy
  has_one_attached :avatar

  has_many :mentions

  validates :username, format: { with: /\A[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*\z/},
                       length: { minimum: 3, maximum: 40 },
                       presence: true,
                       uniqueness: {case_sensitive: false}
end
