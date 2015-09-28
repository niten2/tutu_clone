class CreateTrainsRoutes < ActiveRecord::Migration
  def change
    create_table :trains_routes do |t|

      t.timestamps null: false
    end
  end
end
