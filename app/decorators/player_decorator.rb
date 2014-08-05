class PlayerDecorator < Draper::Decorator
  delegate_all

  def full_name
    [first_name, last_name].join(" ")
  end

  def display_overall_rank
    "##{overall_rank}"
  end

  def display_position_rank
    "##{position_rank} amongst #{position}s"
  end

  def display_nerd_rank
    "Aggregate Rank: #{nerd_rank}"
  end
end
