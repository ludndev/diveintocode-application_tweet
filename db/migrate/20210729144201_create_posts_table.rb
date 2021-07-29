class CreatePostsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :posts_tables do |t|
      t.string :content, null: false
      t.timestamps
    end
  end
end
