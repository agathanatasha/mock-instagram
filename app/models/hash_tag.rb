class HashTag < ApplicationRecord
    has_many :post_hash_tags
    has_many :posts, through: :post_hash_tags
    validates :name, presence: true, uniqueness: { case_sensitive: false }
end
