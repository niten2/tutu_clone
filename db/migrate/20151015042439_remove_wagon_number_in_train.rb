class RemoveWagonNumberInTrain < ActiveRecord::Migration
  def change
    remove_column :wagons, :number_in_train
  end
end
