class CreatePostSub < ActiveRecord::Migration
  def change
    create_table :post_subs do |t|
      t.string :post_id, null: false
      t.string :sub_id, null: false

      t.timestamps
    end
    add_index :post_subs, :post_id
    add_index :post_subs, :sub_id
    add_index :post_subs, [:post_id, :sub_id], unique: true # A post can't be posted to the same sub twice 
  end
end
