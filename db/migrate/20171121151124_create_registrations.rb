class CreateRegistrations < ActiveRecord::Migration[5.1]
  def change
    create_table :registrations do |t|

      t.timestamps
    end
  end
end
