class CreatePost < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url
      t.string :content
      t.string :author_id, null: false
      t.timestamps
    end
    add_index :posts, :author_id
  end
end
