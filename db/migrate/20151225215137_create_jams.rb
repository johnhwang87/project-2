class CreateJams < ActiveRecord::Migration
  def change
    create_table :jams do |t|
      t.text :description
      t.string :location
      t.string :time
      t.string :date
      t.string :seeking
      t.integer :user_id
      # t.reference :user

      t.timestamps null: false
    end
  end
end
