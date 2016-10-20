class RemoveColumnFromVotes < ActiveRecord::Migration
  def change
    remove_column :votes, :object_id, :integer
    remove_column :votes, :voter_id, :integer
  end
end
