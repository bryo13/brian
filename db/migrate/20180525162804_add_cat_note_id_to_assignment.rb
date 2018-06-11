class AddCatNoteIdToAssignment < ActiveRecord::Migration[5.2]
  def change
    add_column :assignments, :cat_note_id,:integer
  end
end
