class AddTypeWagon < ActiveRecord::Migration
  def change
    add_column :wagons, :type    , :string
  end
end
