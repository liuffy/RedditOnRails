class RemoveColumnFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :author_id, :string
  end
end
