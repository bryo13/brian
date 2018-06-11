class AddInstitutionIdToAssignments < ActiveRecord::Migration[5.2]
  def change
    add_column :assignments, :institution_id, :integer
  end
end
