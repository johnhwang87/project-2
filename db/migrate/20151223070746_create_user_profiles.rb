class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.string :name
      t.integer :age
      t.string :image_url
      t.string :talents
      t.string :influences
      t.string :skill

      t.timestamps null: false
    end
  end
end
