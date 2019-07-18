class Post < ApplicationRecord
  belongs_to :user

  has_many :post_hash_tags
  has_many :hash_tags, through: :post_hash_tags
  after_commit :create_link_hash_tags

  has_one_attached :image

  validate :image_presence

  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?  
  end

  def create_link_hash_tags
    extract_hash_tag_names.each do |name|
        hash_tag = HashTag.find_by(name: name)
        hash_tag = HashTag.create(name: name) if hash_tag.nil?
        hash_tags << hash_tag          
    end
  end

  # def create_hash_tags
  #   extract_hash_tag_names.each do |name|
  #     hash_tags.create(name: name)
  #   end
  # end

  def extract_hash_tag_names
      description.to_s.scan(/#\w+/).map{|name| name.gsub("#", "").downcase}
  end
end
