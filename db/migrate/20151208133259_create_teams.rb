class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.text :image
      t.date :founded
      t.string :mascot
      t.string :ground
      t.string :league
      t.integer :last_position

      t.timestamps null: false
    end
  end
end
