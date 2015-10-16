class AddPlacesWagon < ActiveRecord::Migration
  def change
    add_column :wagons, :count_side_top_places    , :integer
    add_column :wagons, :count_side_lower_places  , :integer
    add_column :wagons, :count_seat_places        , :integer
  end
end



# t.integer :count_top_places
# t.integer :count_lower_places

# t.integer :count_side_top_places
# t.integer :count_side_lower_places

# t.integer :count_seat_places

