class Player < ActiveRecord::Base
  serialize :day_ranks
  validates :nerd_id, uniqueness: true
  before_create :set_todays_day_rank_empty

  scope :by_overall_rank, -> {
    matches = all.sort_by do |player|
      player.overall_rank
    end
    matches.select do |player|
      player.overall_rank <= 200
    end
  }

  def overall_rank(date = Date.today)
    ranks_for_day(date)[:overall_rank]
  end

  def nerd_rank(date = Date.today)
    ranks_for_day(date)[:nerd_rank]
  end

  def position_rank(date = Date.today)
    ranks_for_day(date)[:position_rank]
  end

  private

  def ranks_for_day(date = Date.today)
    day_ranks[date] || NullDayRanks.new
  end

  def set_todays_day_rank_empty
    self.day_ranks ||= {Date.today => {}}
  end
end
