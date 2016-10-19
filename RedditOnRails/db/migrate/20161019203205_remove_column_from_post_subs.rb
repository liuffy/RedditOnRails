class RemoveColumnFromPostSubs < ActiveRecord::Migration
  def change
    remove_column :post_subs, :sub_id, :string
  end
end
