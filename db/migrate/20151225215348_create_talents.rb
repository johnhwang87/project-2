class CreateTalents < ActiveRecord::Migration
  def change
    create_table :talents do |t|
      t.string :talent
      t.string :experience
      # t.reference :user
      t.timestamps null: false
    end
  end
end
