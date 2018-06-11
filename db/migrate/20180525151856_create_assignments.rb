class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.text :course_code
      t.string :course_name
      t.integer :semester

      t.timestamps
    end
  end
end
