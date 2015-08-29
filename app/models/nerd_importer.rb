class NerdImporter
  def self.import
    FFNerd.api_key = ENV["FANTASY_FOOTBALL_NERD_API_KEY"]
    import_all!
  end

  def self.import_all!
    FFNerd.standard_draft_rankings.each do |ff_player|
      player = Player.find_by(nerd_id: ff_player.playerId)
      if player.nil?
        player = Player.create(
          nerd_id: ff_player.playerId,
          position: ff_player.position,
          first_name: ff_player.fname,
          last_name: ff_player.lname,
          team: ff_player.team,
          bye_week: ff_player.byeWeek
        )
      else
        player.update(
          team: ff_player.team,
          bye_week: ff_player.byeWeek
        )
      end

      player.day_ranks[Date.today] = {
        overall_rank: ff_player.overallRank.to_i,
        position_rank: ff_player.positionRank.to_i,
        nerd_rank: ff_player.nerdRank.to_f
      }
      player.save
    end
  end
end
