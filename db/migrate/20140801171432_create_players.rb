class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.string :team
      t.string :position
      t.integer :nerd_id
      t.integer :bye_week
      t.timestamps
    end
  end
end
