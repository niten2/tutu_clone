class AddParamsTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :starting_station , :string
    add_column :tickets, :end_station      , :string
    add_column :tickets, :surname          , :string
    add_column :tickets, :patronymic       , :string
  end
end
