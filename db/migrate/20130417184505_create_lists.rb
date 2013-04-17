class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.string :type
      t.text :extra_data

      t.timestamps
    end
  end
end
