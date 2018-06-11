class AddSemDateIdToAssignments < ActiveRecord::Migration[5.2]
  def change
    add_column :assignments, :sem_date_id, :integer
  end
end
