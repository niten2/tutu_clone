class AddSequenceNumberInTrain < ActiveRecord::Migration
  def change
    add_column :wagons, :number_in_train, :integer
  end
end
