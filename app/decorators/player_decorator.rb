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

  def avatar
    if position == 'DEF'
      "http://a1.espncdn.com/prod/assets/clubhouses/2010/nfl/bg_elements/teamlogos/#{team.downcase}.png"
    else
      "http://a.espncdn.com/combiner/i?img=/i/headshots/nfl/players/full/#{espn_id}.png&w=200&h=145"
    end
  end

  def display_compared_overall_rank_with_previous
    if compared_overall_rank_with_previous.zero?
      "No change"
    else
      compared_overall_rank_with_previous.abs
    end
  end

  def display_compared_nerd_rank_with_previous
    if compared_nerd_rank_with_previous.zero?
      "No change"
    else
      h.number_with_precision(compared_nerd_rank_with_previous.abs, precision: 3)
    end
  end

  def overall_rank_icon
    if compared_overall_rank_with_previous > 0
      badge_icon(icon_type: 'arrow-up', badge_color: 'green')
    elsif compared_overall_rank_with_previous < 0
      badge_icon(icon_type: 'arrow-down', badge_color: 'red')
    end
  end

  def nerd_rank_icon
    if compared_nerd_rank_with_previous > 0
      badge_icon(icon_type: 'arrow-up', badge_color: 'green')
    elsif compared_nerd_rank_with_previous < 0
      badge_icon(icon_type: 'arrow-down', badge_color: 'red')
    end
  end

  private

  def badge_icon(icon_type:, badge_color:)
    h.content_tag(:span, h.content_tag(:span, '', class: "glyphicon glyphicon-#{icon_type} white-icon"), class: "badge #{badge_color}-badge")
  end
end
