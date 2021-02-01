class AddNumPeopleToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :num_people, :integer
  end
end
