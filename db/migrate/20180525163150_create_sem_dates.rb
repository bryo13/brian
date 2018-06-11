class CreateSemDates < ActiveRecord::Migration[5.2]
  def change
    create_table :sem_dates do |t|
      t.text :date

      t.timestamps
    end
  end
end
