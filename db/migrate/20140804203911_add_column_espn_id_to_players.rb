class AddColumnEspnIdToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :espn_id, :string
  end
end
