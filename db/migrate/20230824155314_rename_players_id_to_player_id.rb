class RenamePlayersIdToPlayerId < ActiveRecord::Migration[7.0]
  def change
    rename_column :stats, :players_id, :player_id
  end
end
