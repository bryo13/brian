class CreateCatNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :cat_notes do |t|
      t.string :name

      t.timestamps
    end
  end
end
