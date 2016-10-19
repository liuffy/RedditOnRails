class Whatever < ActiveRecord::Migration
  def change
    add_column :post_subs, :sub_id, :integer
  end
end
