class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value, null: false
      t.integer :object_id, null: false
      t.integer :voter_id, null: false

      t.timestamps
    end
    add_index :votes, [:object_id, :voter_id], unique: true
    add_index :votes, :object_id
  end
end
