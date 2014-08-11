class Player < ActiveRecord::Base
  POSITIONS = %w(
    QB
    RB
    WR
    TE
    DEF
    K
  ).freeze
  PLAYER_COUNT_TO_SHOW = 200

  serialize :day_ranks
  validates :nerd_id, uniqueness: true
  before_create :set_todays_day_rank_empty

  scope :by_overall_rank, -> {
    matches = all.select do |player|
      player.overall_rank && player.overall_rank <= PLAYER_COUNT_TO_SHOW
    end

    matches.sort_by do |player|
      player.overall_rank
    end
  }

  def self.last_updated
    first.updated_at.to_date
  end

  def self.previous_updated
    last_updated - 1.day
  end

  def overall_rank(date = Player.last_updated)
    ranks_for_day(date)[:overall_rank]
  end

  def nerd_rank(date = Player.last_updated)
    ranks_for_day(date)[:nerd_rank]
  end

  def position_rank(date = Player.last_updated)
    ranks_for_day(date)[:position_rank]
  end

  def compared_overall_rank_with_previous
    overall_rank(Player.previous_updated) - overall_rank
  end

  def compared_nerd_rank_with_previous
    nerd_rank(Player.previous_updated) - nerd_rank
  end

  private

  def ranks_for_day(date = Player.last_updated)
    day_ranks[date] || NullDayRanks.new
  end

  def set_todays_day_rank_empty
    self.day_ranks ||= {Date.today => {}}
  end
end
