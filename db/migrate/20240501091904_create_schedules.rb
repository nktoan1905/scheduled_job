class CreateSchedules < ActiveRecord::Migration[7.1]
  def change
    create_table :schedules do |t|
      t.datetime :send_at
      t.text :content

      t.timestamps
    end
  end
end
