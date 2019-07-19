class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_one_attached :avatar

  validates :username, format: { with: /\A[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*\z/},
                       length: { minimum: 3, maximum: 40 },
                       presence: true,
                       uniqueness: true
end
