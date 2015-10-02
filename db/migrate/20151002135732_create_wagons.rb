class CreateWagons < ActiveRecord::Migration
  def change
    create_table :wagons do |t|
      t.integer :number
      t.integer :count_top_places
      t.integer :count_lower_places
      t.string  :style
      t.integer :train_id
      t.timestamps null: false
    end
  end
end

