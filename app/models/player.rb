class Player < ActiveRecord::Base
  serialize :day_ranks
  validates :nerd_id, uniqueness: true
  before_create :set_todays_day_rank_empty

  def overall_rank(date = Date.today)
    day_ranks[date][:overall_rank]
  end

  def nerd_rank(date = Date.today)
    day_ranks[date][:nerd_rank]
  end

  def position_rank(date = Date.today)
    day_ranks[date][:position_rank]
  end

  private

  def set_todays_day_rank_empty
    self.day_ranks ||= {Date.today => {}}
  end
end
