schedule = ->
  $pills = $('.togglers')
  $players = $('.js-player')
  allPlayers = '.all'

  $pills.on 'click', ->
    target = $(this).find('a').data('position')

    if target == allPlayers
      $players.removeClass('hidden')
    else
      $toShow = $(target)
      $toHide = $players.not(target)
      $toShow.removeClass('hidden')
      $toHide.addClass('hidden')

$(document).ready schedule
$(document).on "page:load", schedule
