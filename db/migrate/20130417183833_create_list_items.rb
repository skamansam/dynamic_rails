class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.string :name
      t.string :type
      t.text :extra_data
      t.references :list

      t.timestamps
    end
    add_index :list_items, :list_id
  end
end
