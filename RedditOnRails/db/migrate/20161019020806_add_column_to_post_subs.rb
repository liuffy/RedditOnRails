class AddColumnToPostSubs < ActiveRecord::Migration
  def change
    add_column :post_subs, :post_id, :integer
  end
end
