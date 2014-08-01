class Player < ActiveRecord::Base
  serialize :day_ranks
  validates :nerd_id, uniqueness: true
  before_create :set_todays_day_rank_empty
  private

  def set_todays_day_rank_empty
    self.day_ranks ||= {Date.today => {}}
  end
end
