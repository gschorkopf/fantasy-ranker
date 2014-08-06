module DashboardHelper
  def position_navigator(position)
    content_tag(:li, position_navigator_path(position), class: "togglers")
  end

  private

  def position_navigator_path(position)
    link_to position, "#", data: { toggle: 'pill', position: ".#{position}-position" }
  end
end
