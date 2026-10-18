class CreatePostComments < ActiveRecord::Migration[8.1]
  def change
    create_table :post_comments do |t|
      t.text :content, null: false
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.string :ancestry, null: false

      t.timestamps
    end
    add_index :post_comments, :ancestry
  end
end
