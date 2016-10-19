class CreateSub < ActiveRecord::Migration
  def change
    create_table :subs do |t|
      t.string :sub_name, null: false
      t.text :description, null: false
      t.integer :moderator_id, null: false

      t.timestamps
    end
    add_index :subs, :sub_name, unique: true
  end
end
