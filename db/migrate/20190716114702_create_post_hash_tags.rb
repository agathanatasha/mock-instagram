class CreatePostHashTags < ActiveRecord::Migration[5.2]
  def change
    create_table :post_hash_tags do |t|
      t.references :post, foreign_key: true
      t.references :hash_tag, foreign_key: true

      t.timestamps
    end
  end
end
