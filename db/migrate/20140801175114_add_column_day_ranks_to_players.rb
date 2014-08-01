class AddColumnDayRanksToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :day_ranks, :text
  end
end
