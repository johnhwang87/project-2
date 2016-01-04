class CreateJams < ActiveRecord::Migration
  def change
    create_table :jams do |t|
      t.string :location
      t.string :time
      t.integer :user_id
      # t.reference :user

      t.timestamps null: false
    end
  end
end
