class PostHashTag < ApplicationRecord
  belongs_to :post
  belongs_to :hash_tag

  validates :post_id , uniqueness:  { scope: :hash_tag_id }
end
