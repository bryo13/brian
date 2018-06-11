class AddYearOfStudyToAssignments < ActiveRecord::Migration[5.2]
  def change
    add_column :assignments, :year_of_study, :integer
  end
end
