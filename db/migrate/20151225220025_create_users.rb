class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.string :talent
      t.string :experience
      t.string :influences
      t.string :location
      t.string :email
      t.string :password_digest
      t.string :image
      # t.reference :talent
      # t.reference :jam

      t.index(:email, unique: true)
      t.timestamps null: false
    end
  end
end
