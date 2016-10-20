class AddPolymorphicAssociation < ActiveRecord::Migration
  def change
    add_column :votes, :voteable_id, :integer, null: false
    add_column :votes, :voteable_type, :string, null: false
    add_column :votes, :voter_id, :integer, null: false

    add_index :votes, [:voteable_id, :voteable_type]
    add_index :votes, [:voter_id, :voteable_id, :voteable_type], unique: true
  end
end
