class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.integer :slackid
      t.string :name
      t.boolean :gender

      t.timestamps
    end
    add_index :users, :slackid, unique: true
  end
end
