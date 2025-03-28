class CreateEventAttendances < ActiveRecord::Migration[7.2]
  def change
    create_table :event_attendances do |t|
      t.references :attended_event, null: false, foreign_key: { to_table: :events }
      t.references :attendee, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
