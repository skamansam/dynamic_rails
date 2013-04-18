class CreateConstraints < ActiveRecord::Migration
  def change
    create_table :constraints do |t|
      t.string :name
      t.string :for_type
      t.text :data_options
      t.text :input_options
      t.references :for_object, :polymorphic=>true
      t.timestamps
    end
  end
end
